class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
  has_many :entries

  # validations
  validates :isbn, uniqueness: true
end
