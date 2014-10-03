require "rails_helper"

describe "Visiting the home page" do
  it "shows the homepage" do
    # visit root_path

    save_and_open_page
    visit "/"
    save_and_open_page
    expect(page).to have_content("Rantly")
    # expect(page).to have_content("Let it all out")
    expect(page).to have_content("Jeff Taggart")
    expect(page).to have_content("Rantly has allowed")
  end
end

describe "Registering with Rantly. =>" do
  it "clicking the join button." do
    visit root_path
    click_link "JOIN"

    expect(page).to have_content("Register")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
  end
  it "Complete registration and see flash message" do
    visit root_path
    click_link "JOIN"

    fill_in "Username", with: "Welker"
    fill_in "Password", with: "pass123"
    fill_in "First name", with: "Wes"
    fill_in "Last name", with: "Welker"
    fill_in "Bio", with: "Awesome Bronco WR"
    # Choose radio button, but radio input html id
    choose 'user_rant_frequency_weekly'

    click_button "Register"
    expect(page).to have_content("Rant.ly")
    # expect(page).to have_content("Let it all out")
    expect(page).to have_content("Thank you for registering!")
  end
end

describe "Login with Rantly. =>" do
  it "clicking the login button." do
    visit root_path
    click_link "Login"

    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_button("LOGIN")
  end
  it "login and see flash message" do
    visit root_path
    click_link "JOIN"

    fill_in "Username", with: "Welker"
    fill_in "Password", with: "pass123"
    fill_in "First name", with: "Wes"
    fill_in "Last name", with: "Welker"
    fill_in "Bio", with: "Awesome Bronco WR"
    # Choose radio button, but radio input html id
    choose 'user_rant_frequency_weekly'

    click_button "Register"

    # visit root_path
    click_link "Login"
    fill_in "Username", with: "Welker"
    fill_in "Password", with: "pass123"

    click_button "LOGIN"

    expect(page).to have_content("Welcome back Wes")
  end
end