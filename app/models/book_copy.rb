class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :library
  has_many :issues,dependent: :destroy
end
