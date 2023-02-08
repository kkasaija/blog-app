# require_relative 'rails_helper'

# RSpec.describe 'Users', type: :system do
#   before(:all) do
#     @user = User.create(
#       Name: 'Lilly',
#       Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       Bio: 'Teacher from Poland.', PostsCounter: 0
#     )

#     User.create(
#       Name: 'Tom',
#       Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       Bio: 'Teacher from Mexico.', PostsCounter: 0
#     )

#     Post.create(
#       user: @user, 
#       Title: 'Post 1 by Lilly',
#       Text: 'This is the third post test by Lilly',
#       LikesCounter: 0,
#       CommentsCounter: 0
#     )

#     Post.create(
#       user: @user,
#       Title: 'Post 2 by Lilly',
#       Text: 'This is the fourth post test by Lilly',
#       LikesCounter: 0,
#       CommentsCounter: 0
#     )
#   end

#   describe 'show page' do
#     it 'should render the profile page of the user' do
#       visit user_path(@user)
#       image = page.find('img')
#       expect(image['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
#     end

#     it 'should display the name of the user' do
#       visit user_path(@user)
#       expect(page).to have_content('Lilly')
#     end
#   end
# end
