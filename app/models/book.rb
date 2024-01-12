class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
  has_many :entries

  # validations
  validates :isbn, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["category", "entries", "library"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author", "category_id", "copies_available", "created_at", "description", "id", "isbn", "library_id", "price",
     "published_date", "row", "title", "total_copies", "updated_at"]
  end
end
