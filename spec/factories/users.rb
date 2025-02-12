FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }  # パスワードはpassword123
    password_confirmation { "password123" } # パスワードはpassword123
    height { 170.0 }  # 身長は170cm
    start_weight { 60.0 } # 開始体重は60kg
    target_weight { 55.0 }  # 目標体重は55kg
    target_date { Date.today + 90 } # 90日後
    theme_color { "#FF5733" } # テーマカラーはFF5733
    name { Faker::Name.name } # 名前はFakerで生成
    avatar_image { nil }  # 画像はnil
  end
end

