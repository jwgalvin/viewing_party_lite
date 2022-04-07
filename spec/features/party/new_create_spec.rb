require 'rails_helper'

RSpec.describe 'Creating a new party:', type: :feature do
  before(:each)   do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password_digest: "12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password_digest: "12345")
    @user3 = User.create!(name: "Blert Bliip", email: "Bnk@aol.com", password_digest: "12345")
    @user4 = User.create!(name: "Banker Biffshi", email: "Bla@aol.com", password_digest: "12345")
  end

  xit "has the party stufffffff on the page", :vcr do
    VCR.use_cassette('stuffff', :record => :new_episodes) do
    visit "/users/#{@user1.id}/movies/5244/parties/new"

    expect(page).to have_content("Duration")
    expect(page).to have_content("Date")
    expect(page).to have_content("Start")
    expect(page).to have_button("Create Party")
    #save_and_open_page
    end
  end

  xit "lists all 4 users to invite", :vcr do
    VCR.use_cassette('4 users', :record => :new_episodes) do
    visit "/users/#{@user1.id}/movies/5244/parties/new"
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to have_content(@user4.name)
    end
  end

  xit "tests happy path", :vcr do
    VCR.use_cassette('happy', :record => :new_episodes) do
    visit "/users/#{@user1.id}/movies/5244/parties/new"

    fill_in("Duration", with: "95")
    #
    fill_in(:date, with: "2022/04/04")
    #page.find("date").set("2022/04/04")
    fill_in(:start, with: "22:00")
    within "##{@user1.id}" do
      check#("users[]")
      end
    within "##{@user2.id}" do
      check#("users[]")
      end
    within "##{@user3.id}" do
      check#("users[]")
      end
      #save_and_open_page
    end
  end
end
