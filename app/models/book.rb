class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
end
