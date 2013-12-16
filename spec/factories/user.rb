FactoryGirl.define do

  factory :user, aliases: %i[author creator] do
    email { Faker::Internet.email }
    password { Faker::Lorem.sentence }
  end

end
