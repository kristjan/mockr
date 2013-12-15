class Mock < ActiveRecord::Base
  has_many :comments, order: 'id DESC'
end
