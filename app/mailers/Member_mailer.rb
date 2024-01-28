class MemberMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(member)
    @email = member.email
    @name = member.name
    @library_name = member.library.name
    mail(
      to: email,
      subject: "Welcome to Our #{library_name}!"
    )
  end

  def expiration_reminder(user)
    @email = user.email
    @user = user
    from_email = user.library.email
    staff = user.library.faculties.where(user_type: 'Staff').pluck(:email)
    @days_until_expiration = user.expired_at - Date.today
    mail(
      from: from_email,
      to: @email,
      cc: staff,
      subject: "Your Member Code is Expiring Soon!"
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
      subject: "Renew Your Membership - Your Member Code is Expiried!"
    )
  end

  def reminder_due_date(entry)
    @user = entry.member
    @entry = entry
    from_email = @user.library.email
    staff = @user.library.faculties.where(user_type: 'Staff').pluck(:email)
    mail(
      from: from_email,
      to: @user.email,
      cc: staff,
      subject: "Your subscription plan is expired"
    )
  end
end