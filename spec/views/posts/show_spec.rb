# require_relative 'rails_helper'

# RSpec.describe 'Posts', type: :feature do
#   let(:user) do
#     User.create(
#       name: 'Tom',
#       photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       bio: 'Teacher from Mexico.',
#       posts_counter: 0
#     )
#   end

#   let(:post) do
#     Post.create(
#       author_id: user.id,
#       title: 'Post #1 by Tom',
#       text: 'This is the first post test by Tom',
#       likes_counter: 0,
#       comments_counter: 0
#     )
#   end

#   let(:commenter) do
#     User.create(
#       name: 'Lilly',
#       photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
#       bio: 'Teacher from Poland.',
#       posts_counter: 0
#     )
#   end

#   let(:comment) do
#     Comment.create(
#       author_id: user.id,
#       post_id: post.id,
#       text: 'Comment 1'
#     )
#   end

#   feature 'show page' do
#     scenario 'should render who wrote the post' do
#       visit user_posts_path(user)
#       expect(page).to have_content('Tom')
#     end

#     scenario 'should show the number of comments it has' do
#       visit user_posts_path(user)
#       expect(page).to(have_content(post.comments_counter))
#     end

#     scenario 'should show the number of likes it has' do
#       visit user_posts_path(user)
#       expect(page).to(have_content(post.likes_counter))
#     end

#     scenario 'should render the username of each commetator' do
#       visit user_posts_path(user)
#       expect(page).to have_content('Tom')
#     end
#   end
# end
