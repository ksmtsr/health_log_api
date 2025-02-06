class DailyTask < ApplicationRecord
    belongs_to :user
    has_many :task_logs
  
    validates :name, presence: true
  end
  