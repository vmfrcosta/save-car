class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :set_winche, only: [:new, :create]

  def index
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip.user = current_user
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.winche = @winche
    if @trip.save
      redirect_to winche_path(@winche)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to root_url
  end

  def my_trips
    @trips = current_user.trips
    @totals = []
    total = 0
    @trips.each do |trip|
      total = (trip.winche.price * (trip.check_out - trip.check_in))
      if total.positive?
        @totals << total
      else
        @totals << trip.winche.price
      end
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def trip_params
    params.require(:trip).permit(:check_in, :check_out, :address, :winche_id)
  end

  def set_winche
    @winche = winche.find(params[:winche_id])
  end
end
