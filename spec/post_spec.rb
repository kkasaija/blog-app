require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  subject { Post.new(AuthorId: first_user.id, Title: 'Hello', Text: 'This is my first post') }
  before { subject.save }

  it 'title length should not be too long' do
    subject.Title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.AuthorId = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should be integer' do
    subject.CommentsCounter = 'String'
    expect(subject).to_not be_valid
  end
end