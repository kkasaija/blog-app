class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :Title, presence: true, length: { maximum: 250 }
  after_initialize :set_defaults

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
    user.increment!(:PostsCounter)
  end

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end

  def set_defaults
    self.LikesCounter ||= 0 if has_attribute? :LikesCounter
    self.CommentsCounter ||= 0 if has_attribute? :CommentsCounter
  end
end
