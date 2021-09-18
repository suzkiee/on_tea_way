FactoryBot.define do
  factory :mock_tea, class: Tea do
    title { "MyString" }
    description { "MyString" }
    temperature { 1 }
    brew_time { 1 }
  end
end
