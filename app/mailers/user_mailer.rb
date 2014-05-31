class UserMailer < ActionMailer::Base
  default from: "langenhagen.rs@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://example.com/login'
  	mail(to:@user.email, subject: "Welcome to the class Tracker")
  end
end
