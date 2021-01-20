require 'rails_helper'

RSpec.describe ProfessionalData, type: :model do
  subject { FactoryBot.build_stubbed(:professional_data) }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an arabic title' do
      subject.title_ar = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an english title' do
      subject.title_en = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an employee_id' do
      subject.employee_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if the started_at is greater than the previous record\'s ended_at for the same employee' do
      first_professional_data = FactoryBot.create(:professional_data, started_at: DateTime.now - 4.months, ended_at: DateTime.now - 3.months)
      second_professional_data = FactoryBot.build_stubbed(:professional_data, started_at: DateTime.now - 4.months, ended_at: DateTime.now - 1.months, employee_id: first_professional_data.employee_id)
      expect(second_professional_data).to_not be_valid
    end

    it 'is valid if the dates intersect for records that belong to different employees' do
      first_professional_data = FactoryBot.create(:professional_data, started_at: DateTime.now - 4.months, ended_at: DateTime.now - 3.months)
      second_professional_data = FactoryBot.build_stubbed(:professional_data, started_at: first_professional_data.started_at, ended_at: first_professional_data.ended_at)
      expect(second_professional_data).to be_valid
    end

    it 'is not valid if the ended_at value is less than the started_at value for the same record' do
      subject.ended_at = subject.started_at - 1.months
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to one employee' do
      expect(subject.employee).to_not eql(nil)
      expect(subject.employee).to be_an(Employee)
      expect(subject.employee.id).to eql subject.employee_id
    end

    it 'is not valid if the employee_id id does not exist' do
      subject.employee_id += 1
      expect(subject).to_not be_valid
    end
  end
end
