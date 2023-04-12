FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { "#{Faker::Number.between(from: 80, to: 100)} degrees Celcius" }
    brew_time { "#{Faker::Number.between(from: 2, to: 6)} minutes" }
  end
end
