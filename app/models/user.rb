class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :weight_logs
  has_many :daily_tasks
  has_many :task_logs
  has_many :menstruation_logs
  has_many :health_syncs
  has_many :post_templates
end
  