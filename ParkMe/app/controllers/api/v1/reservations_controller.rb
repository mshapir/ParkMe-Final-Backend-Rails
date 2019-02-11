class Api::V1::ReservationsController < ApplicationController

  def index
    @reservations = User.find(params[:user_id]).reservations
    if @reservations
      render json: @reservations, status: 200
    else
      render json: [error: 'Not Found'], status: 404
    end
  end

  def create
    @reservation = Reservation.create(reservation_params)
    render json: @reservation, status: 201
  end

  def show
    @reservations = User.find(params[:user_id]).reservations
    render json: @reservations
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    render json: {message:"Zap! Reservation deleted"}
  end

  private

  def reservation_params
    params.permit(:listing_id, :user_id)
  end
end
