class MovieData
  attr_reader :id, :title, :genres, :overview, :cast, :reviews, :runtime, :vote_avg, :image

  def initialize(production, cast, reviews, images)
    @id = production[:id]
    @title = production[:title]
    @genres = set_genres(production)
    @overview = production[:overview]
    @cast = performers(cast)
    @reviews = review(reviews)
    @runtime = production[:runtime]
    @vote_avg = production[:vote_average]
    @image = get_image(images) 
  end

  def set_genres(production)
    genre_names = []
    production[:genres].each do |genre|
      genre_names << genre[:name]
    end
    genre_names
  end

  def performers(cast)
    hash = {}
    cast[:cast].first(10).each do |actor|
      hash[actor[:name]] = actor[:character]
    end
    hash
  end

  def review(reviews)
    hash = {}
    accum = []
      reviews[:results].each do |review|
        hash[review[:author]] = review[:content]
      end
      hash
    end

  def get_image(image) 
    "https://image.tmdb.org/t/p/w200#{image[:logos].first[:file_path]}"
  end

end
