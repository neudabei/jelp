require 'rails_helper'

feature "User interacts with category" do
  background do
    restaurants = Category.create(name: "Restaurants", description: "Places where you can eat.")
    cafes = Category.create(name: "Cafes", description: "Drink coffee, tea and have light snacks.")
    restaurant1 = Business.create!(name: "Mediterranean Olive", description: "The best of the mediterranean cuisine.", website: "http://www.mediterranean-olive.com", user_id: 2)
    restaurant2 = Business.create!(name: "Pasta heaven", description: "Great pasta in all shapes and forms. We also have a cafe with Italian coffee.", website: "http://www.pasta-heaven.com", user_id: 2)

    restaurant1.categories << restaurants
    restaurant2.categories << restaurants
  end

  scenario "user can see a list of categories" do
    visit root_path
    click_link "View all categories"
    expect(page).to have_content "Restaurants"
  end

  scenario "user can see a list of businesses in a category" do
    visit root_path
    click_link "View all categories"
    click_link "Restaurants"
    expect(page).to have_content "Pasta heaven"
  end
end