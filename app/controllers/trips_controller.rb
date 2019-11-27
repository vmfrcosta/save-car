class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    @trip = Trip.new
  end
end
