class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  ADMINISTRATOR = 'administrator'
  MEMBER        = 'member'

  ROLES = [
    ADMINISTRATOR,
    MEMBER
  ]

  validates :organization, :user, presence: true
  validates :role, inclusion: { in: ROLES }
  validates :user_id, uniqueness: { scope: :organization_id }

end
