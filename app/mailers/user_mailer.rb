class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #
  def user_created(user)
    @user = user
    @url = 'http://my-circle.fly.dev//users/sign_in'

    mail to: @user.email, subject: 'Welcome to My Circle!'
  end
end
