require 'rails_helper'

RSpec.describe "Api::V1::HealthSyncs", type: :request do
  describe "GET /health_syncs" do
    it "すべてのヘルスデータ同期が取得できる" do
      create(:health_sync, health_data: { steps: 5000, calories: 2000 }.to_json)
      create(:health_sync, health_data: { steps: 6000, calories: 2500 }.to_json)
  
      get "/api/v1/health_syncs"
  
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("5000")
      expect(response.body).to include("2500")
    end
  end
  
  describe "POST /health_syncs" do
    it "新しいヘルスデータ同期を作成できる" do
      user = create(:user) # ユーザーを作成
  
      post "/api/v1/health_syncs", params: {
        health_sync: {
          user_id: user.id,
          health_data: { steps: 7000, calories: 3000 }.to_json,
          data_type: "fitbit",
          synced_at: Time.now
        }
      }
  
      expect(response).to have_http_status(:created)
      expect(HealthSync.last.health_data).to eq({ steps: 7000, calories: 3000 }.to_json)
      expect(HealthSync.last.user).to eq(user)
    end
  end  
end
