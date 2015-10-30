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

  describe "search_by_name" do
    let(:store){Fabricate(:business)}

    it "returns an empty array if no match was found" do
      expect(Business.search_by_name("help")).to eq([])
    end

    it "returns an empty array if the search_term field is empty" do
      expect(Business.search_by_name("")).to eq([])
    end

    it "returns an array for a partial match" do
      expect(Business.search_by_name(store.name[(1..2)])).to eq([store])
    end

    it "retuns an array for an exact match" do
      expect(Business.search_by_name(store.name)).to eq([store])
    end

    it "orders the search results by time of created_at" do
      store1 = Business.create(name: "Italian cafe", description: "We serve cafe", website: "www.italian-cafe.com", created_at: 1.day.ago)
      store2 = Business.create(name: "Italian Restaurant", description: "We serve Pasta and Pizza", website: "www.italian-restaurant.com")
      expect(Business.search_by_name("Italian")).to eq([store2, store1])
    end
  end
end
