require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  let(:post) do
    Post.create(user:, title: 'One', text: 'This is my first post',
      likes_counter: 0, comments_counter: 0)
  end

  let(:commenter) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  let(:comment) do
    Comment.create(author_id: user.id, post_id: post.id, text: "Tom's second comment")
  end

  feature 'index page' do
    scenario 'page should render the profile image of the user' do
      visit user_posts_path(user.id)
      expect(page.find('img')['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
    end
    scenario 'page should display name of user' do
      visit user_posts_path(user.id)
      expect(page).to have_content('Tom')
    end
    scenario 'page should render the number of posts the user has written' do
      visit user_posts_path(user)
      expect(page).to(have_content(user.posts_counter))
    end
    scenario 'displays the post title' do
      visit user_posts_path(user)
      expect(page).to have_content('One')
    end
    scenario 'displays the post text' do
      visit user_posts_path(user)
      expect(page).to have_content('This is my first post')
    end
    scenario 'displays the first comments on a post' do
      visit user_posts_path(user)
      expect(page).to have_content("Tom's second comment")
    end

    it 'displays the number of likes' do
      visit user_posts_path(user)
      expect(page).to have_content('0')
    end
    it 'displays the number of comments' do
      visit user_posts_path(user)
      expect(page).to have_content('1')
    end
    it 'redirect to the post show page when clicking on the post title' do
      visit user_posts_path(user)
      click_link(post.title)
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end
end
