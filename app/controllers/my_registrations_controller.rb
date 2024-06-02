# A custom solution, instead of messing with devise auto-magical controllers
class MyRegistrationsController < Devise::RegistrationsController
  def create
    super
    return unless @user.persisted?

    UserMailer.user_created(@user).deliver_later
  end
end
