require 'rails_helper'

RSpec.describe "Api::V1::MenstruationLogs", type: :request do
  describe "GET /menstruation_logs" do
    it "すべての月経記録が取得できる" do
      create(:menstruation_log, start_date: "2025-02-01", end_date: "2025-02-07")
      create(:menstruation_log, start_date: "2025-03-01", end_date: "2025-03-07")
  
      get "/api/v1/menstruation_logs"
  
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("2025-02-01")
      expect(response.body).to include("2025-03-01")
    end
  end
  
  describe "POST /menstruation_logs" do
    it "新しい月経記録を作成できる" do
      user = create(:user)  # ユーザーを作成

      post "/api/v1/menstruation_logs", params: {
        menstruation_log: {
          start_date: "2025-04-01",
          end_date: "2025-04-07",
          cycle_length: 28,
          period_length: 5,
          symptoms: "腹痛、頭痛",
          user_id: user.id
        }
      }
  
      expect(response).to have_http_status(:created)
      expect(MenstruationLog.last.start_date.to_date).to eq(Date.parse("2025-04-01"))

    end
  end  
end
