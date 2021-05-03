FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.characters(number: 15) }
  end
end
