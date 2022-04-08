require 'rails_helper'

RSpec.describe 'User dashboard:', type: :feature do

  before(:each) do
    @user1 = User.create!(name: "Bliffert's Blankship", email: "bliffman@gmail.com", password: "test")
    @user2 = User.create!(name: "Blankert's Blankship", email: "blankman@gmail.com", password: "test")
  end

  xit "has stuff on the page" do
    VCR.use_cassette('has_stuff') do

      visit "/users/#{@user1.id}/movies/5244"
      expect(page).to have_content('"Pleasurecraft" related stuff here')
      expect(page).to have_button("Discover Movies")
      expect(page).to have_button("Create Viewing Party for Pleasurecraft")
      expect(page).to have_content("Starring:")
    end
  end
end
