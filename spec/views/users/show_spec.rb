require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'User show page process' do
    before(:each) do
      @user = User.create(name: 'Kisembo',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Mexican teacher',
        posts_counter: 4
      )
  
      Post.create(user: @user, title: 'My first post', text: 'This is my first post')
      Post.create(user: @user, title: 'My second post', text: 'This is my second post')
      Post.create(user: @user, title: 'My third post', text: 'This is my third post')
      @last_post = Post.create(user: @user, title: 'My fourth post', text: 'This is my fourth post')

      visit user_path(@user)
    end

    it 'should show the user profile picture' do
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    it 'should show the user username' do
      expect(page).to have_content(@user.name)
    end

    it 'should show the number of post the user has writen' do
      expect(page).to have_text('Number of posts: 4')
    end

    it 'should sho wthe the users bio' do
      expect(page).to have_content(@user.bio)
    end

    it "should show the user's first 3 posts" do
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end

    it "When user clicks on a user's post, it should redirects to that post's show page" do
      visit user_posts_path(@user)
      click_link(@last_post.title)
      expect(page).to have_current_path(user_post_path(@user, @last_post))
    end

    it "should show a button that lets me view all of a user's posts" do
      visit user_path(User.last)
      expect(page).to have_text('See all posts')
    end

    it "When I click to Show all posts, it should redirects me to the user's post's index page" do
      visit user_path(User.last)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
