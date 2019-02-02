class Api::V1::ParkMeUsersController < ApplicationController
  def login
    @user = ParkMeUser.find_by(username: params[:username].to_s.downcase)

    if @user && @user.authenticate(params[:password])
        token = JsonWebToken.encode({user_id: @user.id})
        user = UserSerializer.new(@user)
        render json: [token: token, user: user], status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def index
    @users = ParkMeUser.all
    render json: @users, status: 200
  end

  def create
      @user = ParkMeUser.create(user_params)
      if @user.save
        user = UserSerializer.new(@user)
        token = JsonWebToken.encode({user_id: @user.id})
        response = { message: 'User created successfully'}
        render json: [user: user, token: token], status: 201
      else
        render json: @user.errors, status: :bad
      end

  end

  def show
    @user = ParkMeUser.find_by(username: params[:username])
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_confirmation, :type = 'ParkMeUser')
  end
end
