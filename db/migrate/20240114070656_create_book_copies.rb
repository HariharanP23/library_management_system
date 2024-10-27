# frozen_string_literal: true

class CreateBookCopies < ActiveRecord::Migration[7.1]
  def change
    create_table :book_copies do |t|
      t.string :book_copy_no
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.boolean :hidden

      t.timestamps
    end
  end
end
