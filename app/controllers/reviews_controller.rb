class ReviewsController < ApplicationController
  before_action :require_user, only: [:create]

  def index
    @reviews = Review.all
  end

  def create
    
  end
end