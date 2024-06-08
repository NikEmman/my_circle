require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'Prevent access when user' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    it 'not signed_in' do
      get posts_path
      expect(response).not_to be_successful
    end
  end
  context 'Prevent access when user signed in but' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    before { sign_in user }

    it 'has not created a profile yet' do
      get posts_path
      expect(response).not_to be_successful
    end
  end
  context 'all before_actions conditions are met ' do
    let(:user) { create(:user) }
    let(:my_post) { create(:post, user:) }
    before { sign_in user }
    before { create(:profile, user:) }

    describe 'GET /index' do
      it 'should render index page' do
        get posts_path
        expect(response).to render_template :index
      end
    end
    describe 'Get /Edit' do
      it 'should render edit page' do
        get edit_post_path(my_post)
        expect(response).to render_template :edit
      end
    end
    describe 'Post /Post' do
      it 'should create a post with valid attributes' do
        post posts_path, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Post was successfully created.'
      end
      it 'should not create a post with invalid attributes' do
        post '/posts', params: { post: FactoryBot.attributes_for(:post, body: nil) }
        expect(flash[:alert]).to eq 'Post was not created'
      end
    end
    describe 'Put /Post' do
      it 'should update a post with valid attributes' do
        put "/posts/#{my_post.id}", params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to post_path(my_post)
        expect(flash[:notice]).to eq 'Post was successfully updated.'
      end

      it 'should not update a post with invalid attributes' do
        put "/posts/#{my_post.id}", params: { post: FactoryBot.attributes_for(:post, body: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end

    describe 'Delete /post' do
      it 'should destroy a post' do
        delete "/posts/#{my_post.id}"
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Post was successfully destroyed.'
      end
    end
  end
end
