require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for logged out users" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to the root path for users already logged in" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:john) {Fabricate(:user)}
      it "sets the session" do
        post :create, {email: john.email, password: john.password}
        expect(session[:user_id]).to eq(john.id)
      end

      it "redirects to the root path" do
        post :create, {email: john.email, password: john.password}
        expect(response).to redirect_to root_path
      end

      it "welcomes the user via a flash message" do
        post :create, {email: john.email, password: john.password}
        expect(flash[:notice]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      let(:john) {Fabricate(:user)}
      it "doesn't set the session" do
        post :create, {email: john.email, password: "wrong_password"}
        expect(session[:user_id]).to be_nil
      end

      it "renders the new template" do
        post :create, {email: john.email, password: "wrong_password"}
        expect(response).to redirect_to login_path
      end

      it "shows an error via a flash message" do
        post :create, {email: john.email, password: "wrong_password"}
        expect(flash[:error]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    it "destroys the session for logged in users" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it "sets the flash notice after logout" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(flash[:notice]).not_to be_blank
    end

    it "redirects to the root path" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end