class Faculty < ApplicationRecord
  # Include default faculties modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :library

  # validations
  validates :email, uniqueness: true, presence: true

  def admin?
    user_type == 'Admin'
  end

  def staff?
    user_type == 'Staff'
  end
end
