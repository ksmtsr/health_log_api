class TaskLog < ApplicationRecord
    belongs_to :user
    belongs_to :daily_task

    # completedの値がtrueまたはfalse以外の値であれば、そのオブジェクトは無効
    validates :completed, inclusion: { in: [true, false] }
  end
  