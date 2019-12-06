class Winch < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :trip_requests, dependent: :destroy

  validates :brand, presence: true
  validates :winch_type, presence: true
  validates :winch_type, presence: true
  validates :plate, presence: true, format: { with: /[A-Z]{3}-?\d[A-Z|0-9]\d{2}/i, message: "-(Placa Invalida)" }, uniqueness: true

  geocoded_by :address, latitude: :win_lat, longitude: :win_long
end
