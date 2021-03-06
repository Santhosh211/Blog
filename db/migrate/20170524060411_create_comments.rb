class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, foreign_key: true
      t.text :body
      t.integer :user_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
