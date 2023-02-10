class User < ApplicationRecord
  # attr_accessor :email_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :Confirmable
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  # validates :email, confirmation: true
  after_initialize :set_defaults
  validates :posts_counter, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def set_defaults
    self.posts_counter ||= 0 if has_attribute? :posts_counter
  end
end
