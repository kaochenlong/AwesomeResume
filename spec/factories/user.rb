# frozen_string_literal: true

FactoryBot.define do
  factory :vendor, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
    role { 'vendor' }
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
    role { 'user' }
  end
end
