require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'should return a correct response' do
    get '/users'
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    expect(response.body).to include('users')
  end

  it 'should return a correct response' do
    get '/users/:id'
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
    expect(response.body).to include('Details of the user which includes both Bio and Posts')
  end
end
