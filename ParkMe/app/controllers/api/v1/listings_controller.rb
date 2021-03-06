class Api::V1::ListingsController < ApplicationController
  before_action :find_listing, only: [:update, :show, :destroy]
  def index
    if params[:user_id]
      @listings = User.find(params[:user_id]).created_listings
    else
      @listings = Listing.all
    end
      render json: @listings, status: 200
  end

  def show
    render json: @listing, status: 200
  end

  def create
    @listing = Listing.create(listing_params)
    if @listing.save

      render json: @listing, status: 201
    else
      render json: {errors: @listing.errors.full_messages}, status: :bad
    end
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      render json: @listing, status: 200
    else
      render json: { errors: @listing.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    listingId = @listing.id
    @listing.destroy
    render json: {message:"Zap! Listing deleted", listingId:listingId}
  end

  private

  def listing_params
    params.permit(:title, :image, :description, :location, :price, :user_id)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
