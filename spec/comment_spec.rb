require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  post = Post.create(AuthorId: user.id, Title: 'Hello', Text: 'This is my first post')
  subject { Comment.create(PostId: post.id, AuthorId: user.id, Text: 'Hi Tom!') }
  before { subject.save }

  it 'postId should be present' do
    subject.PostId = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.AuthorId = nil
    expect(subject).to_not be_valid
  end
end
