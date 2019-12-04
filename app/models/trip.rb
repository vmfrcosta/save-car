class Trip < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  # after_create :broadcast_message
  has_many :photos, dependent: :destroy
  has_many :trip_requests

  belongs_to :winch, optional: true
  belongs_to :car, optional: true
  belongs_to :user, optional: true
  
  geocoded_by :geo_address
  
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

  def broadcast_message(lat, lng, hidden)
    # puts lng
    ActionCable.server.broadcast("trip_#{id}", {
      locals: { trip: self, lat: lat, lng: lng, hidden: hidden },
      current_user_id: user.id
    })
  end

end
