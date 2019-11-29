class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

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
    @trip = Trip.new(new_trip_params)
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
        redirect_to @trip
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

  def new_trip_params
    params.require(:trip).permit(:car_lat, :car_long, :car_address, :dest_address, :winch_id)
  end

  def set_winch
    @winch = Winch.find(params[:winch_id])
  end
  
  def set_user
    @user = current_user
  end

  def select_winch
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant) }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
