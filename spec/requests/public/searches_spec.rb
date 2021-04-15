require 'rails_helper'

RSpec.describe "Public::Searches", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/public/searches/search"
      expect(response).to have_http_status(:success)
    end
  end

end
