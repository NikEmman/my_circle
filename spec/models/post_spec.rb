require 'rails_helper'

RSpec.describe Post, type: :model do
  it ' is correctly associated to user' do
    post = build(:post)
    expect(post.user.id).to be(1)
  end

  it 'has a body' do
    post = build(:post)
    expect(post.body).to eq 'MyString post'
  end

  it 'validates presence of body' do
    post = build(:post, body: '')
    expect(post.valid?).to be false
  end
end
