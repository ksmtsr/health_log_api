Rails.application.routes.draw do
  # Authentication route
  post 'login', to: 'authentication#login'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes with versioning (v1)
  namespace :api do
    namespace :v1 do
      resources :users
      resources :weight_logs
      resources :daily_tasks
      resources :health_syncs
      resources :menstruation_logs
      resources :post_templates
      resources :task_logs
    end
  end
end
