class Faculty < ApplicationRecord
  # Include default faculties modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :library
  has_one_attached :avatar

  # validations
  validates :email, uniqueness: true, presence: true

  def admin?
    user_type == 'Admin'
  end

  def staff?
    user_type == 'Staff'
  end

  def self.ransackable_associations(auth_object = nil)
    ["library"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dob", "doj", "email", "first_name", "id", "last_name", "library_id", "phone_no", "updated_at",
     "user_type"]
  end
end
