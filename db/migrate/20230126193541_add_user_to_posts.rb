class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user
  end
end
