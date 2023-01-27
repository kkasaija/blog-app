require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @new_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  end

  it 'name should be present' do
    @new_user.Name = nil
    expect(@new_user).to_not be_valid
  end

  it 'bio should be present' do
    @new_user.Bio = nil
    expect(@new_user).to_not be_valid
  end

  it 'PostsCounter should be present' do
    @new_user.PostsCounter = nil
    expect(@new_user).to_not be_valid
  end

  it 'PostsCounter should allow valid values' do
    @new_user.PostsCounter = 20
    expect(@new_user).to be_valid
  end

  it 'Name should be present' do
    @new_user.Name = nil
    expect(@new_user).to_not be_valid
  end
end
