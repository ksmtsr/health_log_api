class User < ApplicationRecord
# Devise modules
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable

# DeviseTokenAuth module
include DeviseTokenAuth::Concerns::User

# Secure password for authentication
has_secure_password

# Validations
validates :email, presence: true, uniqueness: true

# Associations
has_many :weight_logs
has_many :daily_tasks
has_many :task_logs
has_many :menstruation_logs
has_many :health_syncs
has_many :post_templates
end
      