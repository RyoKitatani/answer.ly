require 'rails_helper'

RSpec.describe "Public::Responses", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/public/responses/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
