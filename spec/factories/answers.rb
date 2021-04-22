FactoryBot.define do
  factory :answer do
    content { Faker::Lorem.characters(number: 20) }
    member
    question
  end
end
