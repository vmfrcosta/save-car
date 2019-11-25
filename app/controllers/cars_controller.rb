class CarsController < ApplicationController
  def index
    @cars = current_user.cars
  end

  def show

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :brand,
      :model,
      :car_type,
      :plate
    )
  end
end
