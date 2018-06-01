class CreateLendings < ActiveRecord::Migration[5.2]
  def change
    create_table :lendings do |t|
      t.integer :copy_id
      t.integer :borrower_id
      t.datetime :due_date
      t.datetime :lend_date
      t.string :status, :default => "requested"
      t.integer :owner_rating
      t.integer :borrower_rating

      t.timestamps
    end
  end
end
