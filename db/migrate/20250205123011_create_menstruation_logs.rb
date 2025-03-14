class CreateMenstruationLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :menstruation_logs do |t|
      t.references :user, null: false, foreign_key: true # ユーザーID（外部キー）
      t.date :start_date, null: false # 生理開始日
      t.date :end_date # 生理終了日（未入力可）
      t.integer :cycle_length # 生理周期（予測用）
      t.integer :period_length # 生理期間（予測用）
      t.string :symptoms # 生理中の症状（追加）

      t.timestamps
    end
  end
end
