class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.date :published_date
      t.integer :copies_available
      t.integer :total_copies
      t.integer :price
      t.string :row
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
