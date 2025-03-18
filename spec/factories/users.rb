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
    avatar_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/avatar_image.jpg'), 'image/jpeg') }
  end
end
