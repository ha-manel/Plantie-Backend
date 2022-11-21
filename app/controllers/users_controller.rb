class UsersController < ApplicationController
  def index
    @users = User.all
    if @users
      render json: { users: @users}
    else
      render json: {status: :not_found, errors: ['no users found']}
    end
  end

  def show
    @user = User.find(params[:user_id])
    if @user
      render json: {user: @user}
    else
      render json: {status: :not_found, errors: ['user not found']}
    end
  end
      
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {status: :created, user: @user}
    else 
      render json: {status: :internal_server_error, errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
