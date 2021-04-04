require 'rails_helper'

RSpec.describe "Admin::Members", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/members/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/members/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/members/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /connection" do
    it "returns http success" do
      get "/admin/members/connection"
      expect(response).to have_http_status(:success)
    end
  end

end
