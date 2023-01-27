require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.Bio = nil
    expect(subject).to_not be_valid
  end
end