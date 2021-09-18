FactoryBot.define do
  factory :mock_photo, class: Photo do
    url { "MyString" }
    unsplash_id { "MyString" }
    user_uploaded { false }
    user_photo_url { "MyString" }
  end
end
