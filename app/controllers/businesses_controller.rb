class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    
    if @business.save
      flash[:notice] = "Thanks for #{@business.name} to Jelp"
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