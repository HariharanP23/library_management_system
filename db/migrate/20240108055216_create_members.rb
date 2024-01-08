class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :code
      t.string :email
      t.date :dob
      t.string :phone_no
      t.date :expired_at
      t.integer :amount
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
