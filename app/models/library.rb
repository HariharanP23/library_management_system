class Library < ApplicationRecord
  has_many :faculties
  has_many :categories
  has_many :books
  has_many :members
  has_many :entries
  after_create :update_bibrary_id
  def update_bibrary_id
    update_attribute(:library_id, (id + 0.to_i).to_s.rjust(6, '0'))
    Faculty.create(email: email, password: '123456', user_type: 'Admin', library_id: id)
    FacultyMailer.welcome_email(email).deliver_later
  end
end
