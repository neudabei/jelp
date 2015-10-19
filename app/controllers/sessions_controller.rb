class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:notice] = "You are logged in, #{user.full_name}"
    else
      redirect_to login_path
      flash[:error] = "There was something wrong with your login credentials."
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end

end