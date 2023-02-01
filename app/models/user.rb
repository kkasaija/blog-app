class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :Name, presence: true
  after_initialize :set_defaults
  validates :PostsCounter, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def set_defaults
    self.PostsCounter ||= 0 if has_attribute? :PostsCounter
  end
end
