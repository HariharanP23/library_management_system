# frozen_string_literal: true

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
      subject: 'Welcome to Project'
    )
  end

  def expiration_reminder(user)
    @email = user.email
    from_email = user.library.email
    staff = user.library.faculties.where(user_type: 'Staff').pluck(:email)
    @days_until_expiration = user.expired_at - Date.today
    mail(
      from: from_email,
      to: @email,
      cc: staff,
      subject: 'Your subscription is expiring soon'
    )
  end

  def plan_expired(user)
    @user = user
    from_email = user.library.email
    staff = user.library.faculties.where(user_type: 'Staff').pluck(:email)
    @days_until_expiration = user.expired_at - Date.today
    mail(
      from: from_email,
      to: user.email,
      cc: staff,
      subject: 'Your subscription plan is expired'
    )
  end

  def reminder_due_date(user)
    @user = user
    from_email = user.library.email
    staff = user.library.faculties.where(user_type: 'Staff').pluck(:email)
    @days_until_expiration = user.expired_at - Date.today
    mail(
      from: from_email,
      to: user.email,
      cc: staff,
      subject: 'Your subscription plan is expired'
    )
  end
end
