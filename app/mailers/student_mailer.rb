class StudentMailer < ActionMailer::Base
  default from: "anand_tripathi@ymail.com"
  
  #This action send email to newly registered student
  def welcome_email(student)
    @student = student
    @url  = 'http://clarionLibrary.com/login'
    mail(to: @student.email, subject: 'Welcome In Clarion library')
  end

  # This action send a email to student after student's account activation.
  def account_activated(student)
    @student = student
    @url  = 'http://clarionLibrary.com/login'
    mail(to: @student.email, subject: 'Congrat your account has been activated for Clarion library')
  end

  #This action send a email to student after student's account deactivation
  def account_deactivated(student)
    @student = student
    mail(to: @student.email, subject: 'Your account has been De-activated from Clarion library')
  end
end
