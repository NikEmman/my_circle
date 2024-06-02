require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can run specs' do
    # use build so the object is not saved in database, use create to save it in db
    post = build(:post)
    expect(post.user_id).to be(1)
  end
end
