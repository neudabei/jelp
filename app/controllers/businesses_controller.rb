class BusinessesController < ApplicationController
  before_action :require_user, only: [:create] 

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
    @businesses = Business.all
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      flash[:notice] = "Thanks for adding #{@business.name} to Jelp"
      redirect_to new_business_path
    else
      flash[:error] = "The business could not be added."
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :description, :website)
  end
end