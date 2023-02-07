require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @new_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'name should be present' do
    @new_user.name = nil
    expect(@new_user).to_not be_valid
  end

  it 'bio should be present' do
    @new_user.bio = nil
    expect(@new_user).to_not be_valid
  end

  it 'PostsCounter should be present' do
    @new_user.posts_counter = nil
    expect(@new_user).to_not be_valid
  end

  it 'PostsCounter should allow valid values' do
    @new_user.posts_counter = 20
    expect(@new_user).to be_valid
  end

  it 'Name should be present' do
    @new_user.name = nil
    expect(@new_user).to_not be_valid
  end
end
