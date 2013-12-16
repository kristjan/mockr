FactoryGirl.define do

  factory :comment do
    author
    mock
    body { Faker::Lorem.paragraph }
  end

end
