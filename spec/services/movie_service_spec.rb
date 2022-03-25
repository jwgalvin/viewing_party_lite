require 'rails_helper'

  RSpec.describe MovieService do
    let(:movie_deets) { MovieService.movie_deets(5244) }
    let(:casts) { MovieService.cast(5244) }
    let(:reviews) { MovieService.reviews(5244) }
    
    
    it "can call for movies"do 
      VCR.use_cassette('call_for_a_movie_') do
        movie = "Aliens"
        response = MovieService.call_for_a_movie(movie)
        expect(response).to be_a(Hash)
        expect(response[:results].count). to eq(20)
      end
    end 

    it "can call for top movies" do 
      VCR.use_cassette('call_for_top_20_movies') do
        response = MovieService.call_for_top_20_movies
        expect(response).to be_a(Hash)
        expect(response[:results].count). to eq(20)
      end
    end 
  

    it 'establishes a connection for movie_deets' do
      VCR.use_cassette('movie_results') do
        expect(movie_deets).to be_a(Hash)
        expect(movie_deets[:genres]).to be_a(Array)
        expect(movie_deets[:title]).to be_a(String)
        expect(movie_deets[:id]).to be_a(Integer)
        expect(movie_deets[:overview]).to be_a(String)
        expect(movie_deets[:runtime]).to be_a(Integer)
        expect(movie_deets[:vote_average]).to be_a(Float)
      end
    end

    it 'establishes a connection for cast' do
      VCR.use_cassette('cast_results') do
        expect(casts[:cast]).to be_a(Array)
        expect(casts[:cast][0]).to be_a(Hash)
        expect(casts[:cast][0][:name]).to be_a(String)
      end
    end

    it 'establishes a connection for cast', :vcr do
        expect(reviews[:results]).to eq([])
    end

end
