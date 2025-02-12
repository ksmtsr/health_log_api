require 'rails_helper'

RSpec.describe "Api::V1::WeightLogs", type: :request do
  describe "GET /index" do
    it "リクエストが成功すること" do
      create(:weight_log, weight: 55.0)
      create(:weight_log, weight: 60.0)

      get "/api/v1/weight_logs"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end
end
