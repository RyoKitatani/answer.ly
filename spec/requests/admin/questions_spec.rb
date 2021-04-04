require 'rails_helper'

RSpec.describe "Admin::Questions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/questions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/questions/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/questions/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
