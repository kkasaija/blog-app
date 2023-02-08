require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    let(:user) do
      User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    end

    let(:post) do
      Post.create(
        author_id: user.id,
        title: 'Post #1 by Tom',
        text: 'This is the first post test by Tom',
        likes_counter: 0,
        comments_counter: 0
      )
    end

    it 'likesCounter must greater than or equal zero.' do
      post.likes_counter = -10
      expect(post).to_not be_valid
    end

    it 'title must not exceed 250 characters.' do
      post.title = 'just trying'
      expect(post).to be_valid
    end

    it 'title must not be blank' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'Post should have five recent comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
    end
  end
end
