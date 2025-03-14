class CreateWeightLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :weight_logs do |t|
      t.references :user, null: false, foreign_key: true # usersテーブルと関連
      t.float :weight, null: false # 記録した体重
      t.date :recorded_at, null: false # 記録した日付
      t.string :note # 体重記録の備考
      t.float :weight_diff, null: false # 前回の体重との差分
      t.float :progress_rate, null: false # 目標体重との差分の割合 (%)

      t.timestamps
    end
  end
end
