class Review < ApplicationRecord
  belongs_to :user
  belongs_to :winch
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user, presence: true
  validates :winch, presence: true
end
