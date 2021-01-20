class EmployeeMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_mailer.EmployeeCreated.subject
  #
  def employee_created(_id)
    @greeting = 'Hi'

    mail to: 'to@example.org', subject: 'Employee Created for your account'
  end
end
