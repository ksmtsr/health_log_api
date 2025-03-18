Rails.application.routes.draw do
  # DeviseTokenAuth 用のルート
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'  # 1回だけ定義

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes with versioning (v1)
  namespace :api do
    namespace :v1 do
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
