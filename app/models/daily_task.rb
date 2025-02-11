class DailyTask < ApplicationRecord
    belongs_to :user
    has_many :task_logs
  
    # nil や空文字（""）の場合、オブジェクトは無効
    validates :name, presence: true
  end
  