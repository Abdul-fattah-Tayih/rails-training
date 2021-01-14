FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::String.random length: 16 }
  end
end
