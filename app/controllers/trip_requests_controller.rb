class TripRequestsController < ApplicationController

  def show
    @request = TripRequest.find(params[:id])
    @trip = @request.trip
  end
end
