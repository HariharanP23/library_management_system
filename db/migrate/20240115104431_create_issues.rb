# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.references :book_copy, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.string :fine
      t.string :description
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
