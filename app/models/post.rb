class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :likes
  has_many :comments

  validates :Title, presence: true, length: { maximum: 250 }
  
  validates :CommentsCounter, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }

  validates :LikesCounter, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:PostsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
