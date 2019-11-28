class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(new_trip_params)
    if @trip.car_lat.nil? || @trip.car_long.nil?
      @trip.get_coords!('car', @trip.car_address)
    end
    @trip.get_coords!('dest', @trip.dest_address)
    @trip.status = 'searching'
    @winches = Winch.near([@trip.car_lat, @trip.car_long], 50, units: :km)

    @trip.winch = select_winch(@winches)
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

  def new_trip_params
    params.require(:trip).permit(:car_lat, :car_long, :car_address, :dest_address, :winch_id)
  end

  def set_winch
    @winch = Winch.find(params[:winch_id])
  end
  
  def set_user
    @user = current_user
  end

  def get_coords!

  end

  def select_winch
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant) }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
