require 'rails_helper'

RSpec.describe "Api::V1::DailyTasks", type: :request do
  describe "GET /daily_tasks" do
    it "すべてのライフスタイルタスクが取得できる" do
      create(:daily_task, name: "Take a bath")
      create(:daily_task, name: "Use a face pack")
  
      get "/api/v1/daily_tasks"
  
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Take a bath")
      expect(response.body).to include("Use a face pack")
    end
  end
  
  describe "POST /daily_tasks" do
    it "新しいライフスタイルタスクを作成できる" do
      # User をファクトリで作成
      user = create(:user)

      valid_params = { 
        daily_task: { 
          name: "Take a bath", 
          frequency: "毎日", 
          user_id: user.id 
        } 
      }
    
      post "/api/v1/daily_tasks", params: valid_params
    
      expect(response).to have_http_status(:created)
      expect(DailyTask.last.name).to eq("Take a bath")
    end    
  end  
end
