FactoryBot.define do
  factory :subscription do
    customer { nil }
    tea { nil }
    title { "MyString" }
    price { 1.5 }
    status { "MyString" }
    frequency { "MyString" }
  end
end
