require 'rails_helper'

RSpec.describe "Public::Members", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/public/members/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/public/members/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/public/members/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followed" do
    it "returns http success" do
      get "/public/members/followed"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /follower" do
    it "returns http success" do
      get "/public/members/follower"
      expect(response).to have_http_status(:success)
    end
  end

end
