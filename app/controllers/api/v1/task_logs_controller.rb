class Api::V1::TaskLogsController < ActionController::API
  def index
    @task_logs = TaskLog.all
    render json: @task_logs # シリアライザーでTaskLogに関連するDailyTaskのnameもレスポンスに含まれる。
  end

  def show
    @task_log = TaskLog.find(params[:id])
    render json: @task_log
  end

  def create
    @task_log = TaskLog.new(task_log_params)
    if @task_log.save
      render json: @task_log, status: :created
    else
      render json: @task_log.errors, status: :unprocessable_entity
    end
  end

  def update
    @task_log = TaskLog.find(params[:id])
    if @task_log.update(task_log_params)
      render json: @task_log
    else
      render json: @task_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task_log = TaskLog.find(params[:id])
    @task_log.destroy
    head :no_content
  end

  private

  def task_log_params
    params.require(:task_log).permit(:user_id, :daily_task_id, :completed, :completed_at, :recorded_at)
  end
end
