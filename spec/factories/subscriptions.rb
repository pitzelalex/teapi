FactoryBot.define do
  factory :subscription do
    association :tea
    association :customer
    title { Faker::Lorem.sentence(word_count: 2) }
    price { Faker::Number.between(from: 10000, to: 40000) }
    status { 1 }
    frequency { 'Every 3 months' }
  end
end
