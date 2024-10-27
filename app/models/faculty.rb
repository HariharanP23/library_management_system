# frozen_string_literal: true

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

  def self.ransackable_associations(_auth_object = nil)
    ['library']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at dob doj email first_name id last_name library_id phone_no updated_at
       user_type]
  end
end
