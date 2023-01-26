class AddUserAndPostToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user
    add_reference :likes, :post
  end
end
