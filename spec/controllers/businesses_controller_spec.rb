require 'rails_helper'

describe BusinessesController do
  describe "GET new" do
    it "sets the @business variable" do
      get :new
      expect(assigns(:business)).to be_an_instance_of(Business)
    end

    it "sets the @businesses variable" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :new
      expect(assigns(:businesses)).to eq([business1, business2])
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do 
    context "with authenticated users" do # add context only for logged in user
      before do
        session[:user_id] = Fabricate(:user).id
      end

      it "creates a business record when the input is valid" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(Business.first.name).to eq("Business Hermanos Pollo")
      end
      
      it "redirects to new_business_path when the input is valid" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(response).to redirect_to(new_business_path)
      end

      it "sets the flash message with the notice" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(flash[:notice]).not_to be_blank
      end

      it "does not create a business record when the input is valid" do
        post :create, business: {description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(Business.count).to eq(0)
      end

      it "renders the the new template when the input is invalid" do
        post :create, business: {description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(response).to render_template :new
      end

      it "sets the flash message with the error" do
        post :create, business: {description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(flash[:error]).not_to be_blank
      end
    end

    context "with unauthenticated users" do
      before do
        @request.env['HTTP_REFERER'] = 'http://test.host/businesses/new'
      end

      it "renders the same page again" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(response).to redirect_to new_business_path
      end

      it "sets the error flash" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(flash[:error]).not_to be_blank
      end

      it "does not create a business record" do
        post :create, business: {name: "Business Hermanos Pollo", description: "Great chicken!", website: "www.pollos-hermanos.com"}
        expect(Business.count).to eq(0)
      end
    end
  end
end