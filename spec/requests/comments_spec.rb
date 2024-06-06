require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }
  let(:comment) { create(:comment, post:) }
  context 'Prevent access when user' do
    it 'not signed_in' do
      get "/posts/#{post.id}/comments/#{comment.id}"
      expect(response).not_to be_successful
    end
  end
  context 'Prevent access when user signed in but' do
    before { sign_in user }

    it 'has not created a profile yet' do
      get "/posts/#{post.id}/comments/#{comment.id}"
      expect(response).not_to be_successful
    end
  end
  context 'all before_actions conditions are met ' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user:) }
    let(:comment) { create(:comment, post:) }
    before { sign_in user }
    before { create(:profile, user:) }

    describe 'Get /New' do
      it 'should render new page' do
        get "/posts/#{post.id}/comments/new"

        expect(response).to render_template :new
      end
    end

    describe 'Get /Show' do
      it 'should render show page' do
        get "/posts/#{post.id}/comments/#{comment.id}"

        expect(response).to render_template :show
      end
    end

    describe 'Get /Edit' do
      it 'should render edit page' do
        get "/posts/#{post.id}/comments/#{comment.id}/edit"
        expect(response).to render_template :edit
      end
    end
    describe 'Post /Comment' do
      it 'should create a comment with valid attributes' do
        post "/posts/#{post.id}/comments/", params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Comment was successfully created.'
      end
      it 'should not create a comment with invalid attributes' do
        post "/posts/#{post.id}/comments/", params: { comment: FactoryBot.attributes_for(:comment, body: nil) }
        expect(response).to render_template :new
        expect(flash[:notice]).to eq nil
      end
    end
    describe 'Put /Comment' do
      it 'should update a comment with valid attributes' do
        put "/posts/#{post.id}/comments/#{comment.id}", params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to post_path(post)
        expect(flash[:notice]).to eq 'Comment was successfully updated.'
      end

      it 'should not update a comment with invalid attributes' do
        put "/posts/#{post.id}/comments/#{comment.id}",
            params: { comment: FactoryBot.attributes_for(:comment, body: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end

    describe 'Delete /comment' do
      it 'should destroy a comment' do
        delete "/posts/#{post.id}/comments/#{comment.id}"
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Comment was successfully destroyed.'
      end
    end
  end
end
