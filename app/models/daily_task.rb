class DailyTask < ApplicationRecord
    belongs_to :user
    has_many :task_logs
  end
  