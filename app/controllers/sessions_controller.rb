class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username].downcase)
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      @wishlist = Plant.joins(:wishlists).where(wishlists: { user_id: session[:user_id] })
      render json: { logged_in: true, user: @user, wishlist: @wishlist }
    else
      render json: { errors: 'no such user, please try again' }, status: :not_found
    end
  end

  def logged_in?
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user
      @wishlist = Plant.joins(:wishlists).where(wishlists: { user_id: session[:user_id] })
      render json: { logged_in: true, user: @current_user, wishlist: @wishlist }
    else
      render json: { logged_in: false }
    end
  end

  def destroy
    reset_session
    render json: { logged_out: false }, status: :ok
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
