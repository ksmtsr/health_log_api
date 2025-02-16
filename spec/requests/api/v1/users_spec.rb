require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /users" do
    it "すべてのユーザーが取得できる" do
      create(:user, email: "test1@example.com")
      create(:user, email: "test2@example.com")
  
      get "/api/v1/users"
  
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("test1@example.com")
      expect(response.body).to include("test2@example.com")
    end
  end
  
  describe "POST /users" do
    it "新しいユーザーを作成できる" do
      post "/api/v1/users", params: {
        user: {
          email: "newuser@example.com",
          password: "password",
          height: 170,
          start_weight: 70.0,
          target_weight: 65.0,
          target_date: "2025-12-31"
        }
      }
  
      expect(response).to have_http_status(:created)
      expect(User.last.email).to eq("newuser@example.com")
    end
  end  
end
