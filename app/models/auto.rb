class Auto < ApplicationRecord
  validates :model, uniqueness: true
end
