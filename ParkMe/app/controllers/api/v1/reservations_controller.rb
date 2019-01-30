class Api::V1::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    render json: @reservations, status: 200
  end
  
  def create
    @reservation = Reservation.create(reservation_params)
    render json: @reservation, status: 201
  end

  private

  def reservation_params
    params.permit(:listing_id, :user_id)
  end
end
