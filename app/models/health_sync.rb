class HealthSync < ApplicationRecord
    belongs_to :user
  
    validates :health_data, presence: true
    validates :synced_at, presence: true
  end
  