class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

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
    self.PostsCounter ||= 0 if self.has_attribute? :PostsCounter
    self.number ||= 0.0 if self.has_attribute? :number
  end
end
