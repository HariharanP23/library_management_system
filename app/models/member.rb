class Member < ApplicationRecord
  # association
  belongs_to :library
  has_many :entries
  # callback
  after_create :update_code
  # validation
  validates :email, uniqueness: true

  def update_code
    update_attribute(:code, (id + 0.to_i).to_s.rjust(6, '0'))
  end
end
