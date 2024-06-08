require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:my_post) { create(:post, user:) }
  let(:comment) { create(:comment, post: my_post) }
  context 'Prevent access when user' do
    it 'not signed_in' do
      get post_comment_path(my_post, comment)
      expect(response).not_to be_successful
    end
  end
  context 'Prevent access when user signed in but' do
    before { sign_in user }

    it 'has not created a profile yet' do
      get post_comment_path(my_post, comment)
      expect(response).not_to be_successful
    end
  end
  context 'all before_actions conditions are met ' do
    let(:user) { create(:user) }
    let(:my_post) { create(:post, user:) }
    let(:comment) { create(:comment, post: my_post, user:) }
    before { sign_in user }
    before { create(:profile, user:) }

    describe 'Get /Show' do
      it 'should render show page' do
        get post_comment_path(my_post, comment)

        expect(response).to render_template :show
      end
    end

    describe 'Get /Edit' do
      it 'should render edit page' do
        get edit_post_comment_path(my_post, comment)
        expect(response).to render_template :edit
      end
    end
    describe 'Post /Comment' do
      it 'should create a comment with valid attributes' do
        post post_comments_path(my_post), params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to post_path(my_post)
        expect(flash[:notice]).to eq 'Comment was successfully created.'
      end
      it 'should not create a comment with invalid attributes' do
        post post_comments_path(my_post), params: { comment: FactoryBot.attributes_for(:comment, body: nil) }
        expect(flash[:alert]).to eq 'Comment was not created'
      end
    end
    describe 'Put /Comment' do
      it 'should update a comment with valid attributes' do
        put post_comment_path(my_post, comment), params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to post_path(my_post)
        expect(flash[:notice]).to eq 'Comment was successfully updated.'
      end

      it 'should not update a comment with invalid attributes' do
        put post_comment_path(my_post, comment),
            params: { comment: FactoryBot.attributes_for(:comment, body: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end

    describe 'Delete /comment' do
      it 'should destroy a comment' do
        delete post_comment_path(my_post, comment)
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Comment was successfully destroyed.'
      end
    end
  end
end
