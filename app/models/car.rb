class Car < ApplicationRecord
  belongs_to :user
  validates :brand, presence: true
  validates :model, presence: true
  validates :plate, presence: true
  validates :car_type, presence: true
  validates :plate, presence: true, format: { with: /[A-Z]{3}-?\d[A-Z|0-9]\d{2}/i, message: "-(Placa Invalida)" }, uniqueness: true
end
