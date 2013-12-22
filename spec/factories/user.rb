FactoryGirl.define do

  factory :user, aliases: %i[author creator] do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { Faker::Lorem.sentence }
  end

end
