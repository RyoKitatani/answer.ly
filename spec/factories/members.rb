FactoryBot.define do
  factory :member do
    name  {"testuser"}
    email { Faker::Internet.email }
    password  {"password" }
    password_confirmation {"password" }
    is_deleted  {"false" }
    introduction  {"テストアカウントです。"}
    country_code  {"JP"}
    experienced_country {"日本"}
  end
end
