class ChangePosts < ActiveRecord::Migration[7.0]
  def change
   add_column :posts, :title, :string, null: false 
   add_column :posts, :url, :string
   add_column :posts, :content, :text
   add_column :posts, :sub_id, :bigint, null: false 
   add_column :posts, :author_id, :bigint, null: false 

    add_index :posts, :sub_id, unique: true 
    add_index :posts, :author_id, unique: true
    add_foreign_key :posts, :subs, column: :sub_id
    add_foreign_key :posts, :users, column: :author_id
  end 
end
