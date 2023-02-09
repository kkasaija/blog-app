require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    before(:example) do
      user = User.create(
        name: 'John',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'John',
        posts_counter: 0
      )
      get "/users/#{user.id}/posts"
    end

    it 'should render index template' do
      expect(response).to render_template(:index)
    end

    it 'response status should be correct' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:example) do
      user = User.create(
        name: 'John',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'John',
        posts_counter: 0
      )

      post = Post.create(
        title: 'try',
        text: 'tried and tested',
        user:,
        comments_counter: 0,
        likes_counter: 0
      )

      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'should render show template' do
      expect(response).to render_template('show')
    end

    it 'response status should be correct' do
      expect(response).to have_http_status(:ok)
    end
  end
end
