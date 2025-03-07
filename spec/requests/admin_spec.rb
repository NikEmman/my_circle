require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /posts" do
    it "returns http success" do
      get "/admin/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /comments" do
    it "returns http success" do
      get "/admin/comments"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/admin/users"
      expect(response).to have_http_status(:success)
    end
  end

end
