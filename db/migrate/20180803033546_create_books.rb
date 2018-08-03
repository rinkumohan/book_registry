class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.string :isbn
      t.float :price
      t.string :category
      t.boolean :publish_status, default: false
      t.references :user
      t.timestamps
    end
  end
end
