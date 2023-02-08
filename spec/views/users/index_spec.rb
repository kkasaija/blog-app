require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:all) do
    @user = User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.', posts_counter: 0
    )

    User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.', posts_counter: 0
    )

    Post.create(
      user: @user,
      title: 'Post 1 by Lilly',
      text: 'This is the third post test by Lilly',
      likes_counter: 0,
      comments_counter: 0
    )

    Post.create(
      user: @user,
      title: 'Post 2 by Lilly',
      text: 'This is the fourth post test by Lilly',
      likes_counter: 0,
      comments_counter: 0
    )
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
  end
end
