class CreateHealthSyncs < ActiveRecord::Migration[8.0]
  def change
    create_table :health_syncs do |t|
      t.references :user, null: false, foreign_key: true # ユーザーID（外部キー）
      t.json :health_data # ヘルスケアから取得したデータ（JSON形式）
      t.string :data_type # データの種類
      t.datetime :synced_at # 連携日時
      
      t.timestamps
    end
  end
end
