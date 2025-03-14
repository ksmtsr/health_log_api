class CreateTaskLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :task_logs do |t|
      t.references :user, null: false, foreign_key: true # ユーザーID（外部キー）
      t.references :daily_task, null: false, foreign_key: true # daily_tasksとの関連
      t.boolean :completed, default: false, null: false # タスクが達成されたかどうか
      t.datetime :completed_at # タスクが完了した日時
      t.date :recorded_at # 記録した日付

      t.timestamps
    end
  end
end

