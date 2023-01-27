class RenameUsersColumnNames < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.rename(:name, :Name)
      t.rename(:photo, :Photo)
      t.rename(:bio, :Bio)
      t.rename(:posts_counter, :PostsCounter)
    end    
  end
end
