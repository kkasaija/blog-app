class RenameColumnNames < ActiveRecord::Migration[7.0]
  def change
    change_table(:posts) do |t|
      t.rename(:text, :Text)
      t.rename(:title, :Title)
      t.rename(:author_id, :AuthorId)
      t.rename(:comments_counter, :CommentsCounter)
      t.rename(:likes_counter, :LikesCounter)
    end
  end
end
