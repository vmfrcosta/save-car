class Trip < ApplicationRecord
  has_many :photos, dependent: :destroy

  belongs_to :winch
  belongs_to :car
end
