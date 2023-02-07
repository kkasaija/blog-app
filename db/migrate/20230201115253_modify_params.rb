class ModifyParams < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post_id, :integer
    remove_column :comments, :author_id, :integer
    remove_column :likes, :post_id, :integer
    remove_column :likes, :author_id, :integer
    remove_column :posts, :author_id, :integer
    rename_column :comments, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
    rename_column :posts, :user_id, :author_id
  end
end
