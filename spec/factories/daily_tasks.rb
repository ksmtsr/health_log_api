FactoryBot.define do
  factory :daily_task do
    association :user # Userと関連付け
    name { "ウォーキング" } # ウォーキング
    frequency { "毎日" } # 毎日
  end
end
