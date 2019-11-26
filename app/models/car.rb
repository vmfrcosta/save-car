class Car < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true
  validates :model, presence: true
  validates :plate, presence: true, uniqueness: true
  validates :car_type, presence: true
end
