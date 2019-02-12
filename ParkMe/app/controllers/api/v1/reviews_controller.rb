class Api::V1::ReviewsController < ApplicationController

  def index
    @reviews = Listing.find(params[:listing_id]).reviews
    if @reviews
      render json: @reviews, status: 200
    else
      render json: [error: 'Not Found'], status: 404
    end
  end

  def create
    @review = Review.create(review_params)
    render json: @review, status: 201
  end

  def show
    @reviews = Listing.find(params[:user_id]).reviews
    render json: @reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    render json: {message:"Zap! Review deleted"}
  end

  private

  def review_params
    params.permit(:rating, :comment, :listing_id, :user_id)
  end
end
