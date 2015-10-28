require 'rails_helper'

feature "User interacts with review" do
  scenario "user adds a review" do
    business = Fabricate(:business)
    sign_in
    click_link "Add a business"
    click_link "#{business.name}"
    fill_out_form
    expect(page).to have_content "Thanks for adding your review to Jelp."
  end

  def fill_out_form
    fill_in "review_body", with: "What a great business!"
    select('3', :from => 'review_stars') 
    click_button "Submit review"
  end
end

