class EmployeeObserver < ActiveRecord::Observer
  def after_save(employee)
    EmployeeMailer.delay.employee_created employee
    # get daemon to see running jobs
    # stub the mailer for rspec
    # rails-best-practices site
  end
end
