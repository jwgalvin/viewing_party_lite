require 'rails_helper'

RSpec.describe 'Discover things:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert's Blankship", email: "bliffman@gmail.com", password: "test")
    @user2 = User.create!(name: "Blankert's Blankship", email: "blankman@gmail.com", password: "test")

    visit "/users/#{@user1.id}/discover"
  end

  it "has stuff on the page" do
    expect(page).to have_content("Discover movies and things about yourself #{@user1.name}!")
  end

  it "has button to discover Top Rated Movies", :vcr do 
    click_on("Find Top Rated Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end 

  it "has a text field and button to search for movies", :vcr do 
    expect(page).to have_button("Find Movies")
    fill_in("movie", with: "Aliens")
    click_on("Find Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end 
end
