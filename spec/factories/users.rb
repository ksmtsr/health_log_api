FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    height { 170.0 }
    start_weight { 60.0 }
    target_weight { 55.0 }
    target_date { Date.today + 90 }
    theme_color { "#FF5733" }
    name { Faker::Name.name }
    avatar_image { nil }
  end

  factory :weight_log do
    association :user # User と関連付け
    weight { 55.0 }
    recorded_at { Date.current }
    note { "テストメモ" }
    weight_diff { 0.0 }
    progress_rate { 50.0 }
  end
end
