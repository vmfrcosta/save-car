class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = current_user.cars
  end

  def show
  end

  def edit
  end

  def update
    @car.update(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :edit
    end
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

  def destroy
    @car.visible = false
    @car.save
    redirect_to cars_path
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

  def set_car
    @car = Car.find(params[:id])
  end
end
