FactoryBot.define do
  factory :professional_data do
    association :employee
    title { { 'ar': 'مهندس برمجيات', 'en': Faker::Job.title } }
    started_at { DateTime.now - 1.years }
    ended_at { DateTime.now - 6.months }
  end
end
