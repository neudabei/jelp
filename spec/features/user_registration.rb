require 'rails_helper'

feature "User registration" do
  scenario "user registers new account" do
    visit root_path
    click_link "Register"
    fill_in "user_full_name", with: "Bob"
    fill_in "user_email", with: "bob@domain.com"
    fill_in "user_password", with: "password"
    click_button "Register"
    expect(page).to have_content "Welcome to Jelp, Bob. Thank you for registering!"
  end

  let(:john){Fabricate(:user)}

  scenario "user with existing credentials signs in and out" do
    visit root_path
    click_link "Sign in"
    fill_in "email", with: john.email
    fill_in "password", with: john.password
    click_button "Login"
    expect(page).to have_content "You are logged in, #{john.full_name}"

    visit root_path
    click_link "Sign out"
    expect(page).to have_content "You've logged out."
  end

end