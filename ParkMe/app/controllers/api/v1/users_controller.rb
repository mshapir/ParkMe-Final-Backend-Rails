class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate_request!, only: [:login, :create]

  def login
    user = User.find_by(username: params[:username].to_s.downcase)

    if user && user.authenticate(params[:password])
        token = JsonWebToken.encode({user_id: user.id})
        render json: {token: token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end


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
    params.permit(:name, :username, :password, :password_confirmation)
  end
end
