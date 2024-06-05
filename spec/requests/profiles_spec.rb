require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  context 'Prevent access when user' do
    let(:user) { create(:user) }
    let(:profile) { create(:profile) }

    it 'not signed_in' do
      get profile_path(profile)
      expect(response).not_to be_successful
    end
  end

  context 'When user is signed in ' do
    let(:user) { create(:user) }
    let(:profile) { create(:profile, user:) }
    before { sign_in user }
    before { create(:profile, user:) }

    describe 'Get /New' do
      it 'should render new page' do
        get new_profile_path
        expect(response).to render_template :new
      end
    end
    describe 'Get /Edit' do
      it 'should render edit page' do
        get edit_profile_path(profile)
        expect(response).to render_template :edit
      end
    end
    describe 'Post /Profiles' do
      it 'should create a profile with valid attributes' do
        post profiles_path, params: { profile: FactoryBot.attributes_for(:profile) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Profile was successfully created.'
      end
      it 'should not create a profile with invalid first name' do
        post '/profiles', params: { profile: FactoryBot.attributes_for(:profile, first_name: nil) }
        expect(response).to render_template :new
        expect(flash[:notice]).to eq nil
      end
      it 'should not create a profile with invalid last name' do
        post '/profiles', params: { profile: FactoryBot.attributes_for(:profile, last_name: nil) }
        expect(response).to render_template :new
        expect(flash[:notice]).to eq nil
      end
    end
    describe 'Put /Profile' do
      it 'should update a profile with valid attributes' do
        put "/profiles/#{profile.id}", params: { profile: FactoryBot.attributes_for(:profile) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Profile was successfully updated.'
      end

      it 'should not update a profile with invalid first name' do
        put "/profiles/#{profile.id}", params: { profile: FactoryBot.attributes_for(:profile, first_name: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
      it 'should not update a profile with invalid last name' do
        put "/profiles/#{profile.id}", params: { profile: FactoryBot.attributes_for(:profile, last_name: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end
  end
end
