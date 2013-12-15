require 'carrierwave/orm/activerecord'

class Mock < ActiveRecord::Base
  mount_uploader :image, MockUploader

  belongs_to :creator, class_name: 'User'
end
