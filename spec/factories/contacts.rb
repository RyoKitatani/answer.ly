FactoryBot.define do
 factory :contact do
   name { Faker::Name.name  }
   email{ Faker::Internet.email}
   title { Faker::Lorem.characters(number: 20) }
   message { Faker::Lorem.characters(number: 200) }
  end
end