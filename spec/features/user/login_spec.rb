require 'rails_helper'

RSpec.describe 'Login Page' do
  it "has login fields" do 
    visit login_path
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Log In")
  end 

  it "can log a user in if credendtials are correct" do 
    visit login_path

    user = User.create(name: 'Tom', email: 'tom@test.com', password: 'password123', password_confirmation: 'password123')

    fill_in("Email", with: "tom@test.com")
    fill_in("Password", with: "password123")
    click_on("Log In")

    expect(current_path).to eq("/users/#{user.id}")
  end 

  it "can display error message if email is not in database" do 
    visit login_path

    user = User.create(name: 'Tom', email: 'tom@test.com', password: 'password123', password_confirmation: 'password123')

    fill_in("Email", with: "terry@test.com")
    fill_in("Password", with: "password123")
    click_on("Log In")

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your email or password is incorrect")
  end 

  it "can display error message if password is incorrect" do 
    visit '/login'

    user = User.create(name: 'Tom', email: 'tom@test.com', password: 'password123', password_confirmation: 'password123')

    fill_in("Email", with: "terry@test.com")
    fill_in("Password", with: "password1234")
    click_on("Log In")

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your email or password is incorrect")
  end 
end 