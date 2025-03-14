class CreateDailyTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_tasks do |t|
      t.references :user, null: false, foreign_key: true # ユーザーID（外部キー）
      t.string :name # タスク名
      t.string :frequency # 繰り返し頻度

      t.timestamps
    end
  end
end
