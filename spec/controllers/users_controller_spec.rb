require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets the @user instance variable" do
      get :new
      expect(assigns(:user)).to be_an_instance_of(User)
    end

    it "renders the new template"
  end
end