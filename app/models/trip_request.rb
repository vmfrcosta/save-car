class TripRequest < ApplicationRecord
  belongs_to :trip
  belongs_to :winch
end
