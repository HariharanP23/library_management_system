class FacultyMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(email)
    @email = email
    mail(
      to: email,
      subject: "Welcome to Project"
    )
  end
  def expiration_reminder(user)
    @email = user.email
    @days_until_expiration = user.expired_at - Date.today
    mail(
      to: @email,
      subject: "Your subscription is expiring soon"
    )
  end
end