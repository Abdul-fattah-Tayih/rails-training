require 'rails_helper'

# you are telling a store in the specs, go on each line in
# the model
RSpec.describe Employee, type: :model do
  subject { FactoryBot.create(:employee) }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # it { is_expected.to validate_presence_of(:employee_id) }
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

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an arabic name' do
      subject.name_ar = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an english name' do
      subject.name_en = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    # it { is_expected.to belong_to(:employee) }
    # it { is_expected.to have_many(:attendance_details).dependent(:destroy) }
    # dependant destroy
    it 'belongs to one user' do
      expect(subject.user).to_not eql(nil)
      expect(subject.user).to be_a(User)
      expect(subject.user.id).to eql subject.user_id
    end

    # it { should validate_uniqueness_of(:attendance_date).scoped_to(:employee_id) }
    it 'is not valid if the user has multiple employees' do
      new_employee = FactoryBot.create(:employee)
      subject.user_id = new_employee.user_id
      expect(subject).to_not be_valid
    end

    it 'is not valid if the user id does not exist' do
      subject.user_id += 1
      expect(subject).to_not be_valid
    end

    # it { should }
    it 'can have multiple professional data records' do
      professional_data = []
      professional_data << FactoryBot.create(:professional_data, employee: subject)
      professional_data << FactoryBot.create(:professional_data, employee: subject, started_at: DateTime.now - 3.months, ended_at: DateTime.now - 2.months)
      professional_data << FactoryBot.create(:professional_data, employee: subject, started_at: DateTime.now - 2.months, ended_at: DateTime.now - 1.months)

      expect(subject.professional_data.length).to eql 3
      subject.professional_data.each_with_index do |element, index|
        expect(element).to eql professional_data[index]
        expect(element).to be_a ProfessionalData
      end
    end
  end
end
