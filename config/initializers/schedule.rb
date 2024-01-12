SCHEDULER = Rufus::Scheduler.new

SCHEDULER.every '1d' do
  Member.where('expired_at <= ? AND expired_at >= ?', 3.days.from_now, Date.today).each do |user|
    FacultyMailer.expiration_reminder(user).deliver_now
  end
end

SCHEDULER.every '3d' do
  Member.where('expired_at > ?', Date.today).each do |user|
    FacultyMailer.expiration_reminder(user).deliver_now
  end
end

SCHEDULER.every '1d' do
  Entry.where('due_date >= ? AND due_date >= ?', Date.yesterday, Date.today).each do |entry|
    FacultyMailer.expiration_reminder(entry.member).deliver_now
  end
end
