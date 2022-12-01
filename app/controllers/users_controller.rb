class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.username = @user.username.downcase
    if @user.save
      session[:user_id] = @user.id
      render json: { logged_in: true, user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
