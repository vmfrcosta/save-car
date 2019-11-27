class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user

  def new
    @trip = Trip.new
  end

  def create
    @trip
  end

  private

  def trip_params
    params.require(:trip).permit(:car_long, :car_lat)
  end

  def set_user
    @user = current_user
  end
end
