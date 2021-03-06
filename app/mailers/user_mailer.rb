class UserMailer < ApplicationMailer

  default from: 'brynbayliss@hotmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Thanks for signing up!")
  end
end
