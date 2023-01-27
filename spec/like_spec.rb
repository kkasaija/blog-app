require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  post = Post.create(AuthorId: user.id, Title: 'Hello', Text: 'This is my first post')

  before(:each) do
    @like = Like.create(AuthorId: user.id, PostId: post.id)
  end

  it 'post_id should be present' do
    @like.PostId = nil
    expect(@like).to_not be_valid
  end

  it 'author_id should be present' do
    @like.AuthorId = nil
    expect(@like).to_not be_valid
  end
end
