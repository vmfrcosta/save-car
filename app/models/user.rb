class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :winches
  has_many :reviews
  has_many :cars
  has_many :photos

  validates :first_name, presence: true
  validates :last_name, presence: true
end
