FactoryGirl.define do

  factory :user, aliases: [:creator] do
    email { Faker::Internet.email }
    password { Faker::Lorem.sentence }
  end

end