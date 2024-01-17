class Issue < ApplicationRecord
  belongs_to :book_copy
  belongs_to :member
  belongs_to :library
  belongs_to :book

  def self.ransackable_attributes(auth_object = nil)
    ["book_copy_id", "book_id", "created_at", "description", "fine", "id", "id_value", "library_id", "member_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["book", "book_copy", "library", "member"]
  end

end
