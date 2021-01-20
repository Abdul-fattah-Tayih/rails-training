FactoryBot.define do
  factory :employee do
    association :user
    name_ar { 'اسم موظف' }
    name_en { Faker::Name.name }
    title_ar { 'مهندس' }
    title_en { Faker::Job.title }
  end
end
