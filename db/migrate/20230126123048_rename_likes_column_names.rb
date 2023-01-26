class RenameLikesColumnNames < ActiveRecord::Migration[7.0]
  def change
    change_table(:likes) do |t|
      t.rename(:post_id, :PostId)
      t.rename(:author_id, :AuthorId)
    end
  end
end
