require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:all) do
    @user1 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.'
    )

    @user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0
    )

    @post = Post.create(user: @user1, title: 'Hello', text: 'This is my first post')
    Comment.create(author_id: @user1.id, post_id: @post.id,text: 'my comment')
  end

  describe 'index page' do
    it 'should render names of users' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should display the picture in users profile' do
      visit users_path
      images = page.all('img')
      expect(images[0]['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
      expect(images[1]['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'should display the number of posts of each user' do
      visit users_path
      expect(page).to have_content('0')
    end

    it 'after clicking on a user, the user profile page is displayed' do
      visit users_path
      click_link @user1.name
      expect(page).to have_current_path user_path(@user1)
    end
  end
end
