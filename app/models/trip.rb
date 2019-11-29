class Trip < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  has_many :photos, dependent: :destroy
  has_many :trip_requests

  belongs_to :winch, optional: true
  belongs_to :car, optional: true
  belongs_to :user, optional: true
  # validates :description, presence: true
  # validates :status, presence: true
  # validates :win_init_lat, presence: true
  # validates :win_init_long, presence: true
  # validates :car_lat, presence: true
  # validates :car_long, presence: true
  # validates :dest_lat, presence: true
  # validates :dest_long, presence: true
  # validates :total_distance, presence: true, numericality: { only_integer: true }
  # validates :visible, presence: true
  # validates :car, presence: true
  # validates :winch, presence: true

  def broadcast_message
    ActionCable.server.broadcast("trip_#{trip.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "trips/show",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end

  geocoded_by :geo_address
end
