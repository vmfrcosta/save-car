class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :update_win_location, :delivered]

  def index
    @trip = Trip.all
  end
# nothing to see here
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
    @trip.car = @trip.user.cars.first
    # @winches = Winch.near([@trip.car_lat, @trip.car_long], 50, units: :km)
    @winches = Winch.all
    @requests = []
    if @trip.save
      @winches.each do |winch|
        @requests << TripRequest.create(winch: winch, trip: @trip)
      end
      @requests.each do |request|
        # @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        # message = @client.messages.create(
        #                      body: "Você tem uma nova solicitação de serviço! Para ver as informações e aceitá-la, entre em www.savecar.com/requests/#{@id}",
        #                      from: '+14433032789',
        #                      to: '+5511996125717'
        #                    )
        # puts message.sid
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
      status = @trip.status
      name = "#{@trip.winch.user.first_name} #{@trip.winch.user.last_name}"
      plate = @trip.winch.plate
      @trip.broadcast_message(lat: params[:trip][:win_init_lat], lng: params[:trip][:win_init_long], status: status, name: name, plate: plate)
      redirect_to trip_room_path(@trip)
    elsif current_user == @trip.winch.user && @trip.status == 'on the way'
      @trip.update(status: 'arrived')
      respond_to do |format|
        format.js
        format.html { redirect_to trip_room_path(@trip) }
      end
    elsif current_user == @trip.winch.user && @trip.status == 'arrived'
      @trip.update(status: 'delivered')
      @trip.broadcast_message(status: 'delivered')
      redirect_to delivered_trip_path(@trip)
    else
      redirect_to too_late_path
    end
  end

  def update_win_location
    @trip.broadcast_message(lat: params[:lat], lng: params[:lng], status: params[:status], name: params[:name], plate: params[:plate])
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

  def delivered
    #markers for map
    @markers = [
      {lat: @trip.car_lat, lng: @trip.car_long},
      {lat: @trip.dest_lat, lng: @trip.dest_long}
    ]
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:total_price, :total_distance, :win_init_long, :win_init_lat, :car_lat, :car_long, :car_address, :dest_address, :winch_id, :status)
  end

  def set_winch
    @winch = Winch.find(params[:trip][:winch_id])
  end
  
  def set_user
    @user = current_user
  end
end
