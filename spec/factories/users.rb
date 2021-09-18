FactoryBot.define do
  factory :mock_user, class: User do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    password_digest { Faker::Lorem.sentence } 
  end
end
