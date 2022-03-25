class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params.include?("movie")
      movie = params[:movie]
      @movies = MovieFacade.get_list_of_movies(movie)
    else
      @movies = MovieFacade.get_top_20_movies
    end
  end

    def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_show(params[:id])
  end
end
