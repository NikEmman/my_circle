require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }

  describe 'prevent access to unauthed users' do
    it 'should not render index page' do
      get posts_path
      expect(response).not_to render_template :index
    end
  end
  context 'with user signed in ' do
    before { sign_in user }
    describe 'GET /index' do
      it 'should render index page' do
        get posts_path
        expect(response).to render_template :index
      end
    end
    describe 'Get /New' do
      it 'should render new page' do
        get new_post_path
        expect(response).to render_template :new
      end
    end
    describe 'Get /Edit' do
      it 'should render edit page' do
        get edit_post_path(post)
        expect(response).to render_template :edit
      end
    end
    describe 'Post /Post' do
      it 'should create a post with valid attributes' do
        post '/posts', params: { post: attributes_for(:post) }
        expect(response).to redirect_to posts_path
        expect(flash[:notice]).to eq 'Post was successfully created.'
      end
    end
  end
end
