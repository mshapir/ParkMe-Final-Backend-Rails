class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    render json: @user, status: 201
  end

  def show
    @user = User.find_by(username: params[:id])
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end
end
