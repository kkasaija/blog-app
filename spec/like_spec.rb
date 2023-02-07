require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')

  before(:each) do
    @like = Like.create(author_id: user.id, podt_id: post.id)
  end

  it 'post_id should be present' do
    @like.post_id = nil
    expect(@like).to_not be_valid
  end

  it 'author_id should be present' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end
end
