FactoryBot.define do
  factory :member do
    name  { Faker::Lorem.characters(number: 12) }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    is_deleted { "false" }
    introduction  { Faker::Lorem.characters(number: 20) }
    country_code  { "JP" }
    experienced_country { "日本" }
    confirmed_at {Time.now}
  end
end
