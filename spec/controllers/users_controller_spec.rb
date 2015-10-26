require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets the @user instance variable" do
      get :new
      expect(assigns(:user)).to be_an_instance_of(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "creates a new user record if submission is valid" do
        expect(User.count).to eq(1)
      end

      it "redirects to the root path if submission is valid" do
        expect(response).to redirect_to root_path
      end

      it "sets the flash notice if submission is valid" do
        expect(flash[:notice]).not_to be_empty
      end
    end

    context "with invalid input" do
      before do
        post :create, user: {full_name: "Max Mustermann", email: "max@domain.com"}
      end

      it "doesn't create a new record if submission is invalid" do
        expect(User.count).to eq(0)
      end

      it "renders the new template if submission is invalid" do
        expect(response).to render_template :new
      end

      it "sets the flash error if submission is invalid" do
        expect(flash[:error]).not_to be_empty
      end
    end
  end

  describe "GET show" do
    context "when authenticated" do
      let(:john){Fabricate(:user)}
      let(:bob){Fabricate(:user, email: "bob@domain.com")}

      before do
        session[:user_id] = john.id
      end

      it "sets the @user instance variable" do
        get :show, id: bob.id
        expect(assigns(:user)).to eq(bob)
      end

      it "renders the show template" do
        get :show, id: bob.id
        expect(response).to render_template :show
      end
    end
  end
end