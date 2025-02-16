FactoryBot.define do
  factory :post_template do
    association :user

    content { "今日のダイエット進捗" }
    hashtags { "#ダイエット #健康" }
  end
end
