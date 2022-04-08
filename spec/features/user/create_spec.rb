require 'rails_helper'

RSpec.describe 'Creating a new user:', type: :feature do

  it "has stuff on the page" do
    visit '/register'
    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password Confirmation")
    expect(page).to have_button("Create User")
  end

  it 'happy path' do
    visit '/register'

    fill_in("Name", with: "Bliffert's Blankship")
    fill_in("Email", with: "bliffman@gmail.com")
    fill_in("Password", with: "test")
    fill_in("Password Confirmation", with: "test")
    click_button("Create User")
    
    expect(current_path).to eq(dashboard_path)
    expect("#{User.last.name}").to eq("Bliffert's Blankship")
  end

  it ' sad- does not create user if Name empty and displays error' do
    visit '/register'

    fill_in("Name", with: "")
    fill_in("Email", with: "bliffman@gmail.com")
    fill_in("Password", with: "test")
    fill_in("Password Confirmation", with: "test")
    click_button("Create User")

    expect(current_path).to eq('/register')
    expect(page).to have_content("Error: Name can't be blank")
  end

  it ' sad- does not create user if email empty and displays error' do
    visit '/register'

    fill_in("Name", with: "Bliffert's Blankship")
    fill_in("Email", with: "")
    fill_in("Password", with: "test")
    fill_in("Password Confirmation", with: "test")
    click_button("Create User")

    expect(current_path).to eq('/register')
    expect(page).to have_content("Error: Email can't be blank")
  end

  it "can authenticate user registration" do  
    visit '/register'

     fill_in("Name", with: "Bliffert's Blankship")
     fill_in("Email", with: "bliffman@gmail.com")
     fill_in("Password", with: "test")
     fill_in("Password Confirmation", with: "test")
     click_button("Create User")

    expect(current_path).to eq(dashboard_path)
  end 

  it "displays an error if password and password confirmation are not matching" do  
    visit '/register'

     fill_in("Name", with: "Bliffert's Blankship")
     fill_in("Email", with: "bliffman@gmail.com")
     fill_in("Password", with: "test")
     fill_in("Password Confirmation", with: "test1")
     click_button("Create User")

    expect(current_path).to eq("/register")
  end 

  it "displays an error if email is already in the database" do  
    visit '/register'
    User.create(name: "Bliffert's Blankship", email: "bliffman@gmail.com", password: "test")
     
     fill_in("Name", with: "Bliffert's Blankship")
     fill_in("Email", with: "bliffman@gmail.com")
     fill_in("Password", with: "test")
     fill_in("Password Confirmation", with: "test1")
     click_button("Create User")

    expect(current_path).to eq("/register")
  end 
end
