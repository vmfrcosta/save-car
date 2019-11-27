class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :set_winch, only: [:new, :create]

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
    @trip.winch = @winche
    if @trip.save
      redirect_to winch_path(@winch)
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
      total = (trip.winch.price * (trip.check_out - trip.check_in))
      if total.positive?
        @totals << total
      else
        @totals << trip.winch.price
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

  def set_winch
    @winche = Winch.find(params[:winche_id])

  def set_user
    @user = current_user

  end
end
