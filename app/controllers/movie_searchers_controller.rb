class MovieSearchersController < ApplicationController
  def index
    params = params_movie[:search_movie][:title]
    #return if params == {}
    if params.empty?
      flash.now[:danger] = "Recherche non valide, réessayez svp!"
    else
      @movies = MovieDb.new(params).perform
      configuration = Tmdb::Configuration.new
      @img_url = configuration.base_url + configuration.poster_sizes[2]
    end
  end

  private

  def params_movie
    params.permit(search_movie: [:title])
  end
end
