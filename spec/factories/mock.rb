FactoryGirl.define do

  factory :mock do
    creator
    image { MockSpecHelper.random_image_file }
  end

end

