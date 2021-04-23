FactoryBot.define do
  factory :admin do
    email { ENV['ADMIN_EMAIL'] }
    password  { ENV['ADMIN_PASS'] }
  end
end
