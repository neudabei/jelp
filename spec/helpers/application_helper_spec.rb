require 'rails_helper'

describe "ApplicationHelper" do
  describe "#review_average" do
    let(:store) {Fabricate(:business)}
    let(:john) {Fabricate(:user)}
    let(:andrea) {Fabricate(:user, email: "andrea@domain.com")}

    it "correctly calculates the average of stars from reviews" do
      review1 = Review.create(body: "great business", stars: 4, business_id: store.id, user_id: john.id)
      review2 = Review.create(body: "not so great", stars: 2, business_id: store.id, user_id: andrea.id)
      expect(helper.review_average(store)).to eq(3)
    end

    it "results in 0 stars if no stars have been given" do
      expect(helper.review_average(store)).to eq(0)
    end
  end
end