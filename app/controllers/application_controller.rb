class ApplicationController < ActionController::API
  # リクエストヘッダーにトークンが含まれているかを確認
  before_action :authorize_request

  private

  # トークンを検証するメソッド
  def authorize_request
    header = request.headers['Authorization']

    if header.present? && header.starts_with?('Bearer ')
      token = header.split(' ').last
      decoded = JwtHelper.decode(token)
      @current_user = User.find_by(id: decoded[:user_id]) if decoded
    end

    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end
end