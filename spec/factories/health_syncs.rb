FactoryBot.define do
  factory :health_sync do
    association :user # Userと関連付け
    health_data { { steps: 5000, calories: 2000 }.to_json } # 歩数5000、消費カロリー2000
    data_type { "fitbit" }  # fitbit
    synced_at { Time.now } # 現在時刻
  end
end
