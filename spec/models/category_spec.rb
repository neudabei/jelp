require 'rails_helper'

describe Category do
  it {should have_many(:businesses).through(:business_categories)}
  it {should have_many(:business_categories)}

  it "has many businesses through business_categories" do
    italian_restaurant1 = Business.create(name: "Italian Restaurant", description: "We serve pasta and pizza", website: "www.italian-restaurant.com" )
    italian_restaurant2 = Business.create(name: "Italian Restaurant2", description: "We serve pasta and pizza as well", website: "www.italian-restaurant2.com" )    
    restaurants = Category.create(name: "restaurants", description: "all the places you can eat")
    
    italian_restaurant1.categories << restaurants
    italian_restaurant2.categories << restaurants

    expect(restaurants.businesses).to include(italian_restaurant1, italian_restaurant2)
  end
end

