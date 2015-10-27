require 'rails_helper'

feature "User interacts with business" do
  scenario "user adds a new business" do
    sign_in
    click_link "Add a business"
    fill_in "business_name", with: "Pasta Palace"
    fill_in "business_website", with: "www.pasta-palace.com"
    fill_in "business_description", with: "Italian restaurant serves Italian foods, such as Pizza and Pasta."
    click_button "Submit business"
    #save_and_open_page
    expect(page).to have_content "Pasta Palace"
  end
end