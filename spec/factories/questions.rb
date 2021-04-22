FactoryBot.define do
  factory :question do
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 20) }
    member
  end
end
