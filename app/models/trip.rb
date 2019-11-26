class Trip < ApplicationRecord
  belongs_to :winch
  belongs_to :car
  validates :description, presence: true
  validates :status, presence: true
  validates :win_init_lat, presence: true
  validates :win_init_long, presence: true
  validates :car_lat, presence: true
  validates :car_long, presence: true
  validates :dest_lat, presence: true
  validates :dest_long, presence: true
  validates :total_distance, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :visible, presence: true
  validates :car, presence: true
  validates :winch, presence: true
end
