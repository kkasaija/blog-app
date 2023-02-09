require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is not valid without user' do
    like = Like.new(user: nil)
    expect(like).to_not be_valid
  end

  it 'is not valid without post' do
    like = Like.new(post: nil)
    expect(like).to_not be_valid
  end
end
