require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:all) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0
    )

    @user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.'
    )

    @post = Post.create(user: @user1, title: 'One', text: 'This is my first post')
    Comment.create(author_id: @user1.id, post_id: @post.id,text: "Tom's second comment")
  end

  describe 'show page' do
    it 'should render the profile picture of the user' do
      visit user_path(@user1)
      image = page.find('img')
      expect(image['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'should display the name of the user' do
      visit user_path(@user1)
      expect(page).to have_content('Tom')
    end

    it 'displays number of posts the user has written' do
      visit user_path(@user1)
      expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
    end

    it 'displays the correct posts' do
      visit user_path(@user1)
      expect(page).to have_content('This is my first post')
    end

    it 'displays the bio' do
      visit user_path(@user1)
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'displays button to see all posts' do
      visit user_path(@user1)
      expect(page).to have_link('See all posts')
    end

    it 'redirects to the posts index page when the button is clicked' do
      visit user_path(@user1)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user1))
    end

    it 'displays the correct number of comments' do
      visit user_path(@user1)
      expect(page).to have_content('Comments')
    end
    it 'displays the correct number of likes' do
      visit user_path(@user1)
      expect(page).to have_content('Likes: 0')
    end
  end
end
