FactoryBot.define do
  factory :mock_subscription, class: Subscription do
    customer { nil }
    tea { nil }
    title { "MyString" }
    price { 1.5 }
    status { "MyString" }
    frequency { "MyString" }
  end
end
