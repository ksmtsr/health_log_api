class Api::V1::WeightLogsController < ActionController::API
  def index
    @weight_logs = WeightLog.all
    render json: @weight_logs
  end

  def show
    @weight_log = WeightLog.find(params[:id])
    render json: @weight_log
  end

  def create
    @weight_log = WeightLog.new(weight_log_params)
    if @weight_log.save
      render json: @weight_log, status: :created
    else
      render json: @weight_log.errors, status: :unprocessable_entity
    end
  end

  def update
    @weight_log = WeightLog.find(params[:id])
    if @weight_log.update(weight_log_params)
      render json: @weight_log
    else
      render json: @weight_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @weight_log = WeightLog.find(params[:id])
    @weight_log.destroy
    head :no_content
  end

  private

  def weight_log_params
    params.require(:weight_log).permit(:user_id, :weight, :recorded_at, :note, :weight_diff, :progress_rate)
  end
end
