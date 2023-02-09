require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is not valid without user' do
    comment = Comment.new(user: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without post' do
    comment = Comment.new(post: nil)
    expect(comment).to_not be_valid
  end
end
