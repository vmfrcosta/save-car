class TripsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_#{params[:trip_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
