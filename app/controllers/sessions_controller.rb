class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: {logged_in: true, user: @user}
    else
      render json: { status: :not_found, errors: ['no such user, please try again']}
    end
  end

  def is_logged_in?
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user
      render json: {logged_in: true, user: @current_user}
    else
      render json: {logged_in: false, errors: 'no such user'}
    end
  end

  def destroy
    reset_session
    render json: {status: :ok, logged_out: false}
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
