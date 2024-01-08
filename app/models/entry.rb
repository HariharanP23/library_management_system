class Entry < ApplicationRecord
  belongs_to :book
  belongs_to :member
  belongs_to :library
end
