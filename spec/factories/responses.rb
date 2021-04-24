FactoryBot.define do
  factory :response do
    content { Faker::Lorem.characters(number: 20) }
    member
    answer
  end
end
