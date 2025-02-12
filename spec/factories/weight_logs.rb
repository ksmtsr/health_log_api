FactoryBot.define do
  factory :weight_log do
    association :user  # Userと関連付け
    weight { 55.0 } # 55kg
    recorded_at { Date.current }  # 今日の日付
    note { "テストメモ" } # テストメモ
    weight_diff { 0.0 } # 0kg
    progress_rate { 50.0 }  # 50%
  end
end
