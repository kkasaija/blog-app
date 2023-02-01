require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'should return a correct response' do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    expect(response.body).to include("List of user's posts here")
  end

  it 'should return a correct response' do
    get '/users/:id/posts/:id'
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
    expect(response.body).to include('Details of a specific post of a user')
  end
end
