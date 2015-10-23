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
      user2 = User.create(full_name: "Bob Stein", email: "bobstein@domain.com", password: "password321")
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      review1 = Review.create(user: user1, business: business1, body: "Great business!", stars: 4, created_at: 2.days.ago)
      review2 = Review.create(user: user2, business: business1, body: "Very good service!", stars: 3, created_at: 1.day.ago)
      review3 = Review.create(user: user2, business: business2, body: "Not that good. Don't recommend it", stars: 0)
      get :index
      expect(assigns(:reviews)).to eq([review3, review2, review1])
    end
  end

  describe "POST create" do
    context "with authenticated users" do
      let(:john) {Fabricate(:user)}
      let(:store) {Fabricate(:business)}

      before do
        session[:user_id] = john.id
      end

      it "creates a review record when the input is valid" do
        binding.pry

        post :create, review: {body: "Great place. We had a good time.", stars: 4}, business_id: store.id
        expect(Review.first.body).to eq("Great place. We had a good time.")
      end

      it "redirects to the business show page"
      it "sets the flash notice"

      it "doesn't create a review record when inpus is invalid"
      it "it renders the business show page"
      it "sets the flash error"

    end

    context "with unauthenticated users" do
      it "does not create a review record"
      it "redirects to the login page"
      it "sets a flash error message"
    end
  end
end