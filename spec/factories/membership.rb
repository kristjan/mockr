FactoryGirl.define do

  factory :membership do
    user
    organization
    role { Membership::MEMBER }
  end

  factory :administratorship, parent: :membership do
    role { Membership::ADMINISTRATOR }
  end

end
