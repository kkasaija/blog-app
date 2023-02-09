require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(
      name: 'John',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'John',
      posts_counter: 0
    )
  end

  it 'name cannot be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter must have a numeric value' do
    subject.posts_counter = 'John'
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be greater than or equal to zero' do
    subject.posts_counter = -10
    expect(subject).to_not be_valid
  end

  it 'should have three last posts' do
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end
end
