FactoryBot.define do
  factory :subscription do
    tea { nil }
    customer { nil }
    title { "MyString" }
    price { 1 }
    status { "MyString" }
    frequency { "MyString" }
  end
end
