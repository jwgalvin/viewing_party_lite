require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert's Blankship", email: "bliffman@gmail.com", password: "test")
    @user2 = User.create!(name: "Blankert's Blankship", email: "blankman@gmail.com", password: "test")
    visit "/users/#{@user1.id}/discover"
  end

  it "displays Top Rated Movies" do 
    VCR.use_cassette('top_movies_results', re_record_interval: 7.days) do 
      click_on("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page.status_code).to eq 200
      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_content(8.7)
    end
  end 

  it "has button to return to Discover Page", :vcr do 
    click_on("Find Top Rated Movies")
    click_on("Discover Page")
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end 

  it "displays movie search results" do 
    VCR.use_cassette('movie_search_results', re_record_interval: 7.days) do
      expect(page).to have_button("Find Movies")
      fill_in("movie", with: "Aliens")
      click_on("Find Movies")
      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page).to have_link("Aliens")
    end 
  end 
end