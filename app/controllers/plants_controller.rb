class PlantsController < ApplicationController
  def index
    render json: {plants: Plant.all}, status: :ok
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
