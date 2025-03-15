Rails.application.routes.draw do
  # DeviseTokenAuth 用のルート
  mount_devise_token_auth_for 'User', at: 'auth'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes with versioning (v1)
  namespace :api do
    namespace :v1 do
      # Devise の API 用設定（セッションをスキップ）
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions'
      }, skip: :sessions

      # 各リソースのルート
      resources :users, only: [:index, :show, :update, :destroy]
      resources :weight_logs
      resources :daily_tasks
      resources :health_syncs
      resources :menstruation_logs
      resources :post_templates
      resources :task_logs
    end
  end
end
