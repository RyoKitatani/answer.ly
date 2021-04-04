require 'rails_helper'

RSpec.describe "Public::Contacts", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/public/contacts/new"
      expect(response).to have_http_status(:success)
    end
  end

end
