class RenameCommentsColumnNames < ActiveRecord::Migration[7.0]
  def change
    change_table(:comments) do |t|
      t.rename(:post_id, :PostId)
      t.rename(:text, :Text)
      t.rename(:author_id, :AuthorId)
    end
  end
end
