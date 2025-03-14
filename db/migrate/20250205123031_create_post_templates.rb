class CreatePostTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :post_templates do |t|
      t.references :user, null: false, foreign_key: true # ユーザーID（外部キー）
      t.string :content # 投稿内容（カスタマイズ可能）
      t.string :hashtags # 投稿に関連するハッシュタグ

      t.timestamps
    end
  end
end
