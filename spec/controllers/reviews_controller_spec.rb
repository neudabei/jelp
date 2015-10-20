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
      review1 = Review.create(body: "Great business!", stars: "4", created_at: (Time.now - (60*60*24)))
      review2 = Review.create(body: "Very good service!", stars: "3", created_at: (Time.now - (60*60*12)))
      review3 = Review.create(body: "Not that good. Don't recommend it", stars: 0)
      get :index
      expect(assigns(:reviews)).to eq([review3, review2, review1])
    end
  end
end