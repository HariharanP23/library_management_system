SCHEDULER = Rufus::Scheduler.new

SCHEDULER.every '1d' do
  Member.where('expired_at <= ? AND expired_at >= ?', 3.days.from_now, Date.today).each do |user|
    FacultyMailer.expiration_reminder(user).deliver_now
  end
end
