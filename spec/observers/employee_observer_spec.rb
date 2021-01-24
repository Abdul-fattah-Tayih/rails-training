require 'rails_helper'

describe EmployeeObserver do
  before do
    employee = FactoryBot.create(:employee)
    allow(EmployeeMailer).to receive(:employee_created).with(employee).and_return('inserted')
  end

  it 'queues an email after creating an employee' do
    # allow_any_instance_of().to receive().and_return()
    # when running specs, block sending email
    # expect(Mailer).to receive(:delay) | :deliver
    # test if the job was inserted in the queue
    expect(Delayed::Job.count).to eql 1
  end
end
