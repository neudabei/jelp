require 'rails_helper'

describe ReviewsController do
  describe "GET index" do
    it "sets the @reviews variable" do
      review = Fabricate(:review)
      get :index
      expect(assigns(:reviews)).to eq([review])
    end

    it "renders the template" do
      get :index
      expect(response).to render_template :index
    end

    it "shows most recent reviews first" do
      user1 = Fabricate(:user)
      user2 = Fabricate(:user)
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      review1 = Review.create(user: user1, business: business1, body: "Great business!", stars: 4, created_at: 2.days.ago)
      review2 = Review.create(user: user2, business: business1, body: "Very good service!", stars: 3, created_at: 1.day.ago)
      review3 = Review.create(user: user2, business: business2, body: "Not that good. Don't recommend it", stars: 0)
      get :index
      expect(assigns(:reviews)).to eq([review3, review2, review1])
    end
  end
end