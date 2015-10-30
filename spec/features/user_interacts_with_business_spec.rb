require 'rails_helper'

feature "User interacts with business" do
  let(:restaurant){Fabricate(:business)}

  scenario "user adds a new business" do
    sign_in
    click_link "Add a business"
    fill_out_form
    expect(page).to have_content "Pasta Palace"
  end

  scenario "user searches for a business" do
    visit root_path
    fill_in "search_term", with: "#{restaurant.name}"
    click_button "Submit"
    expect(page).to have_content "#{restaurant.name}"
  end
  
  def fill_out_form
    fill_in "business_name", with: "Pasta Palace"
    fill_in "business_website", with: "www.pasta-palace.com"
    fill_in "business_description", with: "Italian restaurant serves Italian foods, such as Pizza and Pasta."
    click_button "Submit business" 
  end
end


