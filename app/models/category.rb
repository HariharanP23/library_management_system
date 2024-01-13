class Category < ApplicationRecord
  belongs_to :library
  has_many :books
end
