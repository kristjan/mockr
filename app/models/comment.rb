class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :mock

  validates :author, :mock, :body, presence: true
end
