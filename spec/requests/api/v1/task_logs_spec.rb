require 'rails_helper'

RSpec.describe "Api::V1::TaskLogs", type: :request do
  describe "GET /task_logs" do
    it "すべてのタスクログが取得できる" do
      # daily_taskを作成し、nameを設定
      daily_task = create(:daily_task, name: "Exercise")
      
      # タスクログを作成
      task_log = create(:task_log, daily_task: daily_task)

      get "/api/v1/task_logs"
      
      expect(response).to have_http_status(:ok)

      # レスポンスボディをJSONとしてパース
      parsed_response = JSON.parse(response.body)

      # タスクログの中にdaily_taskのnameが含まれていることを確認
      expect(parsed_response.first['name']).to eq(daily_task.name)
    end
  end
  
  describe "POST /task_logs" do
    it "新しいタスクログを作成できる" do
      user = create(:user)
      daily_task = create(:daily_task, user: user)  # daily_taskを作成
    
      post "/api/v1/task_logs", params: {
        task_log: {
          user_id: user.id,
          daily_task_id: daily_task.id,
          completed: false,
          recorded_at: Date.today
        }
      }
    
      expect(response).to have_http_status(:created)
      expect(TaskLog.last.user_id).to eq(user.id)
      expect(TaskLog.last.daily_task_id).to eq(daily_task.id)
    end    
  end  
end
