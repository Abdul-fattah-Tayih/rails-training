# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employee_mailer/EmployeeCreated
  def EmployeeCreated
    EmployeeMailer.EmployeeCreated
  end

end
