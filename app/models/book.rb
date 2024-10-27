# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
  has_many :issues, dependent: :destroy
  has_many :book_copies, dependent: :destroy

  # validations
  validates :isbn, uniqueness: true
  validates :total_copies, :author, :category_id, :isbn, :title, :price, presence: true

  # callback
  after_create :create_book_copies

  def create_book_copies
    total_copies.times do |i|
      BookCopy.create(book_copy_no: "#{isbn}#{i + 1}", library_id: library_id, book_id: id, hidden: false)
    end
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category entries library]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[author category_id copies_available created_at description id isbn library_id price
       published_date row title total_copies updated_at]
  end
end
