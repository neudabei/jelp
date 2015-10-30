require 'rails_helper'

describe Business do
  it {should validate_presence_of(:name)}
  it {should belong_to(:user)}
  it {should have_many(:reviews)}
  it {should have_many(:business_categories)}
  it {should have_many(:categories).through (:business_categories)}


  it "is in many categories through business_categories" do
    italian_restaurant = Business.create(name: "Italian Restaurant", description: "We serve pasta and pizza and also have a bar", website: "www.italian-restaurant.com" )
    restaurants = Category.create(name: "restaurants", description: "all the places you can eat")
    bars = Category.create(name: "bars", description: "a place where alcohol is served")
    italian_restaurant.categories << restaurants
    italian_restaurant.categories << bars
    expect(italian_restaurant.categories).to include(restaurants, bars)
  end
end
