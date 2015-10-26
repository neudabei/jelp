class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Jelp, #{@user.full_name}. Thank you for registering!"
      redirect_to root_path
    else
      flash[:error] = "You could not be registered."
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end