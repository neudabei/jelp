require 'rails_helper'

describe CategoriesController do
  describe "GET index" do
    it "sets the @categories instance variable" do
      restaurants = Category.create(name: "restaurants", description: "all the places you can eat")
      cafes = Category.create(name: "cafes", description: "small, informal restaurants serving coffee and light refreshments")
      bars = Category.create(name: "bars", description: "a place where alcohol is served")
      get :index
      expect(assigns(:categories)).to eq([restaurants, cafes, bars])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template (:index)
    end
  end
end