require 'rails_helper'

RSpec.describe 'User dahsboard:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")
    @the_dark_knight = Party.create!(duration: 66, date: "01/12/13", start: "14:00", movie_id: 155)
    @user_party = UserParty.create!(user_id: @user1.id, party_id: @the_dark_knight.id)
  end
  
  it "has stuff on the page" do
    visit "/users/#{@user1.id}"

    expect(page).to have_content("#{@user1.name}'s Magical dashboard")
    expect(page).to_not have_content("#{@user2.name}'s Magical dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end

  xit "has viewing parties user has created" do
    visit "/users/#{@user1.id}"

    within("#viewing-parties") do 
      expect(page).to have_content("Insert Movie Here")
      expect(page).to have_content(@the_dark_knight.date)
      expect(page).to have_content(@the_dark_knight.start)
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
  end 

  xit "has viewing parties user is invited to" do

    within("#vp") do 
      expect(page).to have_content("Insert Movie Here")
      expect(page).to have_content(@the_dark_knight.date)
      expect(page).to have_content(@the_dark_knight.start)
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
  end 
end
