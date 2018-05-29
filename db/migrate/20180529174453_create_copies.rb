class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :condition
      t.datetime :purchased_date
      t.string :notes

      t.timestamps
    end
  end
end
