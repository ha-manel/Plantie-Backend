class WishlistsController < ApplicationController
  def create
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      render json: { wishlist: @wishlist }, status: :created
    else
      render json: { errors: @wishlist.errors.full_messages }, status: :internal_server_error
    end
  end

  def destroy
    Wishlist.delete_by(user_id: params[:user_id], plant_id: params[:plant_id])
    render json: { status: :ok }
  end

  def wishlist_params
    params.require(:wishlist).permit(:user_id, :plant_id)
  end
end
