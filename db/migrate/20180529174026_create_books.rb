class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.string :author
      t.string :short_description
      t.string :info_link
      t.string :cover_img

      t.timestamps
    end
  end
end
