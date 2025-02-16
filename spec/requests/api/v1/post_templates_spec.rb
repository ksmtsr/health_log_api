require 'rails_helper'

RSpec.describe "Api::V1::PostTemplates", type: :request do
  describe "GET /post_templates" do
    it "すべてのポストテンプレートが取得できる" do
      create(:post_template, content: "Diet Update", hashtags: "#diet")
      create(:post_template, content: "Weekly Progress", hashtags: "#progress")
    
      get "/api/v1/post_templates"
    
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Diet Update")
      expect(response.body).to include("Weekly Progress")
    end    
  end
  
  describe "POST /post_templates" do
    it "新しいポストテンプレートを作成できる" do
      user = create(:user)  # ユーザーを作成
      post "/api/v1/post_templates", params: {
        post_template: {
          content: "New Progress",
          hashtags: "#progress",
          user_id: user.id
        }
      }
    
      expect(response).to have_http_status(:created)
      expect(PostTemplate.last.content).to eq("New Progress")
    end    
  end  
end
