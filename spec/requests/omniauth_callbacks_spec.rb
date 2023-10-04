require 'rails_helper'

RSpec.describe "OmniauthCallbacks", type: :request do
  describe "GET /facebook" do
    it "returns http success" do
      get "/omniauth_callbacks/facebook"
      expect(response).to have_http_status(:success)
    end
  end

end
