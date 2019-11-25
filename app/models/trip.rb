class Trip < ApplicationRecord
  belongs_to :winch
  belongs_to :car
end
