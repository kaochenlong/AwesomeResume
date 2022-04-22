FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
    role { ["user", "admin", "staff", "vendor"].sample }
  end
end
