class User < ApplicationRecord
  has_many :cars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :winches
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :winches
  has_many :reviews
  has_many :cars
  # mount_uploader :url, PhotoUploader

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
