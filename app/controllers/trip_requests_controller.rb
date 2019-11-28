class TripRequestsController < ApplicationController

  def show
    @request = TripRequest.find(params[:id])
  end
end
