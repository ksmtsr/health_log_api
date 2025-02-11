class Api::V1::DailyTasksController < ActionController::API
  def index
    @daily_tasks = DailyTask.all
    render json: @daily_tasks
  end

  def show
    @daily_task = DailyTask.find(params[:id])
    render json: @daily_task
  end

  def create
    @daily_task = DailyTask.new(daily_task_params)
    if @daily_task.save
      render json: @daily_task, status: :created
    else
      render json: @daily_task.errors, status: :unprocessable_entity
    end
  end

  def update
    @daily_task = DailyTask.find(params[:id])
    if @daily_task.update(daily_task_params)
      render json: @daily_task
    else
      render json: @daily_task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_task = DailyTask.find(params[:id])
    @daily_task.destroy
    head :no_content
  end

  private

  def daily_task_params
    params.require(:daily_task).permit(:user_id, :name, :frequency)
  end
end
