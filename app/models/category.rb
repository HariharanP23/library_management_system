class Category < ApplicationRecord
  belongs_to :library
  has_many :books

  # validation
  validates :name, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["books", "library"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "library_id", "name", "updated_at"]
  end
end
