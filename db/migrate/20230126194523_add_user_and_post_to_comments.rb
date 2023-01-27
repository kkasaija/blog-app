class AddUserAndPostToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user
    add_reference :comments, :post
  end
end
