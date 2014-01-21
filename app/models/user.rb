class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mocks, foreign_key: 'creator_id'
  has_many :memberships
  has_many :organizations, through: :memberships

  validates :name, presence: true

  def admin?(organization)
    memberships.where(
      organization: organization,
      role: Membership::ADMINISTRATOR
    ).exists?
  end

  def join!(organization, admin=false)
    membership = memberships.where(
      organization: organization
    ).first_or_initialize

    role = admin ? Membership::ADMINISTRATOR : Membership::MEMBER
    membership.role = role unless membership.administrator?

    membership.save!
  end

  def member?(organization)
    memberships.where(organization: organization).exists?
  end
end
