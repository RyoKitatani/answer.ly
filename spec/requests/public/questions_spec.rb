require 'rails_helper'

RSpec.describe "Public::Questions", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/public/questions/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/public/questions/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/public/questions/new"
      expect(response).to have_http_status(:success)
    end
  end

end
