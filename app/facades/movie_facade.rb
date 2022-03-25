
class MovieFacade
  class << self
    def get_list_of_movies(movie)
      data = MovieService.call_for_a_movie(movie)
      movies(data)
    end

    def get_top_20_movies
      data = MovieService.call_for_top_20_movies
      movies(data)
    end

    def movie_show(movie_id)
      production = MovieService.movie_deets(movie_id)
      cast = MovieService.cast(movie_id)
      reviews= MovieService.reviews(movie_id)
      image = MovieService.image(movie_id)
      movie = MovieData.new(production, cast, reviews, image)
    end

    private

    def movies(data)
      data[:results].map do |result|
        Movie.new(id: result[:id], title: result[:title], vote_average: result[:vote_average])
      end
    end
  end
end
