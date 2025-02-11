class Api::V1::MenstruationLogsController < ActionController::API
  def index
    @menstruation_logs = MenstruationLog.all
    render json: @menstruation_logs
  end

  def show
    @menstruation_log = MenstruationLog.find(params[:id])
    render json: @menstruation_log
  end

  def create
    @menstruation_log = MenstruationLog.new(menstruation_log_params)
    if @menstruation_log.save
      render json: @menstruation_log, status: :created
    else
      render json: @menstruation_log.errors, status: :unprocessable_entity
    end
  end

  def update
    @menstruation_log = MenstruationLog.find(params[:id])
    if @menstruation_log.update(menstruation_log_params)
      render json: @menstruation_log
    else
      render json: @menstruation_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menstruation_log = MenstruationLog.find(params[:id])
    @menstruation_log.destroy
    head :no_content
  end

  private

  def menstruation_log_params
    params.require(:menstruation_log).permit(:user_id, :start_date, :end_date, :cycle_length, :period_length, :symptoms)
  end
end
