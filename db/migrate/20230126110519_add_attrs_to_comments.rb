class AddAttrsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author_id, :integer
  end
end
