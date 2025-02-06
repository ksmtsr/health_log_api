class TaskLog < ApplicationRecord
    belongs_to :user
    belongs_to :daily_task
  
    validates :completed, inclusion: { in: [true, false] }
  end
  