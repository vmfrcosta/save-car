class Guincho < ApplicationRecord
  validates :model, uniqueness: true
end
