# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :library_id
      t.string :name
      t.string :location
      t.date :established_date
      t.time :opening_hours_start
      t.time :opening_hours_end
      t.string :email

      t.timestamps
    end
  end
end
