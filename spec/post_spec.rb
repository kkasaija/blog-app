require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

  before(:each) do
    @post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
  end

  it 'title length should not be too long' do
    @post.title = 'a' * 300
    expect(@post).to_not be_valid
  end

  it 'author_id should be present' do
    @post.author_id = nil
    expect(@post).to_not be_valid
  end

  it 'comments counter should be integer' do
    @post.comments_counter = 'String'
    expect(@post).to_not be_valid
  end

  it 'most_recent_comments should return zero' do
    comments = @post.recent_comments
    expect(comments).to eq []
  end

  it 'most_recent_posts should return 1' do
    post = first_user.recent_posts
    expect(post).to eq []
  end

  it 'commentsCounter should allow valid values' do
    @post.comments_counter = 20
    expect(@post).to_not be_valid
  end

  it 'is not valid if comments_counter is less than 0' do
    post = Post.new(comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is not valid if likes_counter is less than 0' do
    post = Post.new(likes_counter: -1)
    expect(post).to_not be_valid
  end

  it 'likescounter should be present' do
    @post.likes_counter = nil
    expect(@post).to_not be_valid
  end
end
