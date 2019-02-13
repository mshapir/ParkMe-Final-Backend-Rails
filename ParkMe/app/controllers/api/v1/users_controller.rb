class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate_request!, only: [:login, :create, :social_create]

  def login
    user = User.find_by(username: params[:username].to_s.downcase)

    if user && user.authenticate(params[:password])
        token = JsonWebToken.encode({user_id: user.id})
        user_data = UserSerializer.new(user)
        render json: {token: token, user: user_data}, status: :ok
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
    user = UserSerializer.new(@user)
    token = JsonWebToken.encode({user_id: @user.id})
    render json: {user: user, token: token}, status: 201
   else
    render json: {errors: @user.errors.full_messages}, status: :bad
   end
  end

  def social_create
    @user = User.find_by(username: params[:username])
    if @user
      user = UserSerializer.new(@user)
      token = JsonWebToken.encode({user_id: @user.id})
      render json: {user: user, token: token}, status: 201
    else
      sha256 = Digest::SHA256.new
      password = sha256.digest params[:password]
      @user = User.create(
        name: params[:name],
        username: params[:username],
        password: password,
        password_confirmation: password
      )
      if @user.save
        response = { message: 'User created successfully'}
        user = UserSerializer.new(@user)
        token = JsonWebToken.encode({user_id: @user.id})
        render json: {user: user, token: token}, status: 201
      else
        render json: {errors: @user.errors.full_messages}, status: :bad
      end
    end
  end

  def show
    user = JsonWebToken.decode(request.authorization)
    @user = User.find(user[0]["user_id"])
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_confirmation)
  end
end
