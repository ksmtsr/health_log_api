class TaskLogSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :daily_task_id, :completed, :completed_at, :recorded_at, :name

  belongs_to :daily_task

  def name
    object.daily_task.name  # TaskLogの関連であるDailyTaskからnameを取得
  end
end