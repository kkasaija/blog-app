class ModifyParams < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :PostId, :integer
    remove_column :comments, :AuthorId, :integer
    remove_column :likes, :PostId, :integer
    remove_column :likes, :AuthorId, :integer
    remove_column :posts, :AuthorId, :integer
    rename_column :comments, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
    rename_column :posts, :user_id, :author_id
  end
end
