FactoryBot.define do
  factory :mock_photo, class: Photo do
    url { Faker::Internet.url }
    unsplash_id { Faker::Lorem.sentence }
    user_uploaded { true }
    user_photo_url { Faker::Internet.url }
  end
end
