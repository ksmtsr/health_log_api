class Api::V1::WeightLogsController < ActionController::API
  before_action :authenticate_user!
  before_action :set_weight_log, only: [:show, :update, :destroy]

  def index
    weight_logs = current_user.weight_logs.order(created_at: :desc)
    render json: weight_logs.map { |log| log_json(log) }
  end

  def show
    render json: @weight_log
  end

  # 新しい体重記録を作成
  def create
    weight_log = current_user.weight_logs.new(weight_log_params)
    if weight_log.save
      render json: log_json(weight_log), status: :created
    else
      render json: { errors: weight_log.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @weight_log.update(weight_log_params)
      render json: @weight_log
    else
      render json: @weight_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @weight_log.destroy
    head :no_content
  end

  private

  def log_json(weight_log)
    weight_log.as_json(only: [:id, :weight, :recorded_at, :note, :weight_diff, :progress_rate])
  end

  def set_weight_log
    @weight_log = current_user.weight_logs.find(params[:id])
  end

  def weight_log_params
    params.require(:weight_log).permit(:weight, :recorded_at, :note, :weight_diff, :progress_rate)
  end
end
