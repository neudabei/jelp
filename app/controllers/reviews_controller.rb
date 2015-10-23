class ReviewsController < ApplicationController
  before_action :require_user, only: [:create]

  def index
    @reviews = Review.all
  end

  def create
    binding.pry
    @business = Business.find_by(id: params[:business_id])
    
    @review = @business.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Thanks for adding your review to Jelp"
    else
      flash[:error] = "Your review could not be added. You can only add one review per business."
    end
    redirect_to business_path(@business)
  end

  private

  def review_params
    params.require(:review).permit(:body, :stars)
  end
end