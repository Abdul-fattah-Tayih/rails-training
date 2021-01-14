FactoryBot.define do
  factory :employee do
    association :user
    name { { 'ar': 'اسم موظف', 'en': Faker::Name.name } }
    title { { 'ar': '', 'en': Faker::Job.title } }
  end
end
