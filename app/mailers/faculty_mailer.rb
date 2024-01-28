class FacultyMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(email, library_name, role)
    @email = email
    @name = library_name
    @role = role
    mail(
      to: email,
      subject: "Welcome to Our Team #{library_name}"
    )
  end
end