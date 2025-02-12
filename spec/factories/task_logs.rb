FactoryBot.define do
  factory :task_log do
    association :user # Userと関連付け
    association :daily_task # DailyTaskと関連付け
    completed { false } # 未完了
    recorded_at { Date.today } # 今日の日付
  end
end
