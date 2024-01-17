class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # association
  belongs_to :library
  has_many :entries
  has_many :issues
  # callback
  after_create :update_code
  # validation
  validates :email, uniqueness: true

  def update_code
    update_attribute(:code, (id + 0.to_i).to_s.rjust(6, '0'))
  end

  def self.ransackable_associations(auth_object = nil)
    ["entries", "library"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "code", "created_at", "dob", "email", "expired_at", "id", "library_id", "name", "phone_no", "updated_at"]
  end
end
