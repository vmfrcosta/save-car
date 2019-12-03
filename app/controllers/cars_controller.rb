class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[show edit update destroy]

  def index
    @cars = current_user.cars
  end

  def show
  end

  def new
    @car = Car.new
    @user = current_user
    autos = Auto.all
    @brands = autos.map(&:brand).uniq
    @models = autos.map(&:model).uniq
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to user_cars_path(current_user)
    else
      render :new
    end
  end

  def edit
    autos = Auto.all
    @brands = autos.map(&:brand).uniq
    @models = autos.map(&:model).uniq
  end

  def update
    @car.update(car_params)
    if @car.save
      redirect_to user_cars_path(current_user, @car)
    else
      render :edit
    end
  end

  def destroy
    @car.visible = false
    @car.save
    redirect_to user_cars_path(current_user)
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

  def check_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

  def check_owner
    unless current_user == User.find(params[:user_id])
      redirect_to root_path
    end
  end
end
