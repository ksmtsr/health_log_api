require 'rails_helper'

RSpec.describe "Api::V1::WeightLogs", type: :request do
  let!(:user) { create(:user) }
  let!(:weight_logs) { create_list(:weight_log, 3, user: user) }

  describe "GET /index" do
    it "リクエストが成功し、全ての体重記録を取得できる" do
      get "/api/v1/weight_logs"

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end

  describe "POST /create" do
    it "新しい体重記録が作成できる" do
      valid_params = { 
        weight_log: { 
          weight: 58.0, 
          recorded_at: Date.today, 
          note: "テスト", 
          progress_rate: 10, 
          user_id: user.id 
        } 
      }

      expect {
        post "/api/v1/weight_logs", params: valid_params
      }.to change(WeightLog, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "無効なパラメータの場合、作成に失敗する" do
      invalid_params = { 
        weight_log: { 
          weight: nil, 
          recorded_at: Date.today, 
          user_id: user.id 
        } 
      }

      expect {
        post "/api/v1/weight_logs", params: invalid_params
      }.not_to change(WeightLog, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /update" do
    let!(:weight_log) { weight_logs.first }

    it "既存の体重記録を更新できる" do
      update_params = { 
        weight_log: { 
          weight: 60.0, 
          note: "更新テスト", 
          progress_rate: 20 
        } 
      }

      put "/api/v1/weight_logs/#{weight_log.id}", params: update_params

      expect(response).to have_http_status(:ok)
      weight_log.reload
      expect(weight_log.weight).to eq(60.0)
      expect(weight_log.note).to eq("更新テスト")
      expect(weight_log.progress_rate).to eq(20)
    end

    it "無効なパラメータの場合、更新に失敗する" do
      invalid_params = { 
        weight_log: { 
          weight: nil 
        } 
      }

      put "/api/v1/weight_logs/#{weight_log.id}", params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
      weight_log.reload
      expect(weight_log.weight).not_to be_nil
    end
  end

  describe "DELETE /destroy" do
    let!(:weight_log) { weight_logs.first }

    it "体重記録を削除できる" do
      expect {
        delete "/api/v1/weight_logs/#{weight_log.id}"
      }.to change(WeightLog, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
