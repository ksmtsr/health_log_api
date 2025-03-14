source "https://rubygems.org"

# Railsのバージョンを指定
gem "rails", "~> 8.0.1"

# データベースとサーバー関連のgem
gem "pg"
gem "puma", ">= 5.0"  # PumaはRailsアプリケーションのデフォルトサーバー

# タイムゾーン関連のgem（WindowsやJRubyプラットフォーム向け）
gem "tzinfo-data", platforms: %i[windows jruby]

# キャッシュとキュー関連
gem "solid_cache"  # キャッシュ管理
gem "solid_queue"  # キュー管理
gem "solid_cable"  # Action Cable関連

# アプリケーションの起動を高速化するgem
gem "bootsnap", require: false

# デプロイメントのためのgem
gem "kamal", require: false  # Dockerデプロイをサポート

# アセットのキャッシュやX-Sendfileの高速化
gem "thruster", require: false

# クロスオリジンAJAXを可能にするCORS対応のgem
gem "rack-cors"

# 開発とテスト用のgem
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"  # デバッグ用gem
  gem "brakeman", require: false  # セキュリティの静的解析ツール
  gem "rubocop-rails-omakase", require: false  # Rubyスタイルチェックツール
  gem "rspec-rails"  # RSpecテスト用のgem
  gem "factory_bot_rails" # テストデータ作成用のgem
  gem 'faker'  # テストデータ作成用のgem
  gem 'simplecov', require: false  # テストカバレッジ計測用のgem
  
  # 認証とデータベース関連
  gem "jwt"  # JSON Web Token（JWT）関連
  gem 'devise'  # 認証関連
  gem 'devise-jwt'  # JWTトークンを使った認証
  gem 'bcrypt', '~> 3.1.7'  # パスワードのハッシュ化
  gem 'active_model_serializers'  # シリアライザー
end

gem "devise_token_auth", "~> 1.2"
gem 'omniauth', '>= 1.0.0'

