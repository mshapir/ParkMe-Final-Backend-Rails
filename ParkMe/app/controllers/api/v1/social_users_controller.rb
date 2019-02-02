class SocialUsersController < ApplicationController
  def login
    @user = SocialUser.find_by(username: params[:username].to_s.downcase)

    if @user
        token = JsonWebToken.encode({user_id: @user.id})
        user = UserSerializer.new(@user)
        render json: [token: token, user: user], status: :ok
    else
      @user = SocialUsersController.create(user_params)
    end
  end

  def index
    @users = SocialUser.all
    render json: @users, status: 200
  end

  def create
      @user = SocialUser.create(user_params)
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
    @user = SocialUser.find_by(username: params[:username])
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :username, :userId, :accessToken, :signedRequest)
  end
end
