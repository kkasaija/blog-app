require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0
    )
  end

  let(:post) do
    Post.create(user:, title: 'One', text: 'This is my first post',
      likes_counter: 0, comments_counter: 0
    )
  end

  let(:commenter) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0
    )
  end

  let(:comment) do
    Comment.create(author_id: user.id, post_id: post.id, text: "Tom's second comment")
  end

  feature 'show page' do
    scenario 'I can see who wrote the post' do
      visit user_posts_path(user)
      expect(page).to have_content(user.name)
    end

    scenario 'shows number of likes a post has' do
      visit user_posts_path(user)
      expect(page.body).to include('Number of posts')
    end
  end
end
