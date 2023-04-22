class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false 
      t.string :url, optional: true 
      t.text :content, optional: true 
      t.bigint :sub_id, null: false 
      t.bigint :author_id, null: false 
      t.timestamps
    end
    add_index :posts, :sub_id, unique: true 
    add_index :posts, :author_id, unique: true
    add_foreign_key :posts, :subs, column: :sub_id
    add_foreign_key :posts, :users, column: :author_id
  end
end
