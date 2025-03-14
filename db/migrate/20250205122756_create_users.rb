class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false # メールアドレス（ユニーク）
      t.string :password_digest # パスワード（認証用）
      t.float :height # 身長（cm）
      t.float :start_weight # ダイエット開始時の体重
      t.float :target_weight # 目標体重
      t.date :target_date # 目標達成予定日
      t.string :theme_color # ユーザーが選択したテーマカラー
      t.string :name # ユーザーの名前
      t.string :avatar_image # アバター画像のURL

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
