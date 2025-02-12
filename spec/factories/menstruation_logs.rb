FactoryBot.define do
  factory :menstruation_log do
    association :user # Userと関連付け
    start_date { Date.today - 5 } # 5日前
    end_date { Date.today - 3 } # 3日前
    cycle_length { 28 } # 28日間
    period_length { 5 } # 5日間
    symptoms { "腹痛、頭痛" } # 腹痛、頭痛
  end
end
