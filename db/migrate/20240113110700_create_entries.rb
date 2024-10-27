# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.references :book, null: false, foreign_key: true
      t.date :start_date
      t.date :due_date
      t.date :return_date
      t.integer :fine_amount
      t.references :member, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
