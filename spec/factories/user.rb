FactoryGirl.define do

  factory :unaffiliated_user, class: 'User' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.sentence }
  end

  factory :user, parent: :unaffiliated_user, aliases: %i[author creator] do
    after(:create) do |user|
      user.join!(create(:organization))
    end
  end

end
