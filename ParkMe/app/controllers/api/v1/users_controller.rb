class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end
  def create
    @user = User.create(user_params)
    if @user.save
    response = { message: 'User created successfully'}
    render json: @user, status: 201
   else
    render json: @user.errors, status: :bad
   end
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
