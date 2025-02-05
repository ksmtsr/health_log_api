module JwtHelper
  SECRET_KEY = Rails.application.credentials.secret_key_base

  # トークンの生成
  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  # トークンの検証とデコード
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError => e
    nil # 無効なトークンの場合はnilを返す
  end
end