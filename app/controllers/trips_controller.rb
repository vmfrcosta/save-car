class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :update_win_location]

  def index
    @trip = Trip.all
  end

  def show
    # action cable vai trazer o guincho que aceitar a corrida
    @requests = @trip.trip_requests
    @markers = [
      {lat: @trip.car_lat, lng: @trip.car_long},
      {lat: @trip.dest_lat, lng: @trip.dest_long}
    ]
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.car_lat.nil? || @trip.car_long.nil?
      geocoded = Geocoder.search(@trip.car_address).first.data
      @trip.car_lat = geocoded['lat']
      @trip.car_long = geocoded['lon']
    end
    geocoded = Geocoder.search(@trip.dest_address).first.data
    @trip.dest_lat = geocoded['lat']
    @trip.dest_long = geocoded['lon']
    @trip.status = 'searching'
    @trip.user = current_user
    # @winches = Winch.near([@trip.car_lat, @trip.car_long], 50, units: :km)
    @winches = Winch.all
    @requests = []
    if @trip.save
      @winches.each do |winch|
        @requests << TripRequest.create(winch: winch, trip: @trip)
      end
      redirect_to trip_room_path(@trip)
    else
      raise
    end
  end

  def update
    if @trip.status == 'searching'
      @trip.update(trip_params)
      @trip.status = 'on the way'
      @trip.winch = Winch.find(params[:trip][:winch_id])
      @trip.save
      @trip.broadcast_message(params[:trip][:win_init_lat], params[:trip][:win_init_long])
      redirect_to trip_room_path(@trip)
    else
      redirect_to too_late_path
    end
  end

  def update_win_location
    if @trip.status == 'on the way'
      @trip.broadcast_message(params[:lat], params[:lng])
    else
      raise
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
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:win_init_long, :win_init_lat, :car_lat, :car_long, :car_address, :dest_address, :winch_id)
  end

  def set_winch
    @winch = Winch.find(params[:trip][:winch_id])
  end
  
  def set_user
    @user = current_user
  end
end
