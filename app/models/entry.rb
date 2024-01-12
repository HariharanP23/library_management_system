class Entry < ApplicationRecord
  belongs_to :book
  belongs_to :member
  belongs_to :library

  # validation
  validates :book_id, presence: true

  # callback
  after_create :available_count_decrease
  after_update :increase_available_count, if: -> { saved_changes.key?(:return_date) }

  def available_count_decrease
    available_book = book.copies_available
    book.update(copies_available: available_book - 1)
  end

  def increase_available_count
    return unless return_date.present?

    available_book = book.copies_available
    book.update(copies_available: available_book + 1)
  end
end
