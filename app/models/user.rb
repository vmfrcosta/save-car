class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :winches, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :photos

  mount_uploader :photo, PhotoUploader

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
