require 'rails_helper'

describe BusinessesController do
  describe "GET index" do
    it "sets the @businesses variable" do
      business1 = Business.create(name: "Italian Restaurant")
      business2 = Business.create(name: "Apple Store")
      get :index
      expect(assigns(:businesses)).to eq([business1, business2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end