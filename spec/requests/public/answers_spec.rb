require 'rails_helper'

RSpec.describe "Public::Answers", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/public/answers/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
