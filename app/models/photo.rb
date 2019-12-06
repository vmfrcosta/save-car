class Photo < ApplicationRecord
  mount_uploader :url, PhotoUploader
  belongs_to :user
end
