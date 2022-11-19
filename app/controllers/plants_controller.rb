class PlantsController < ApplicationController
  def index
    @new = Plant.where(new: true)
    @discount = Plant.where('discount != price')
    @indoor = Plant.where(habitat: 'indoor')
    @outdoor = Plant.where(habitat: 'outdoor')
    render json: {new: @new, discount: @discount, indoor: @indoor, outdoor: @outdoor}, status: :ok
  end

  def show
    @plant = Plant.find(params[:id])
    if @plant
      render json: {plant: @plant}, status: :ok
    else
      render json: {error: "plant doesn't exist"}, status: :not_found
    end
  end
end
