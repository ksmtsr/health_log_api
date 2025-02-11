class Api::V1::HealthSyncsController < ActionController::API
  def index
    @health_syncs = HealthSync.all
    render json: @health_syncs
  end

  def show
    @health_sync = HealthSync.find(params[:id])
    render json: @health_sync
  end

  def create
    @health_sync = HealthSync.new(health_sync_params)
    if @health_sync.save
      render json: @health_sync, status: :created
    else
      render json: @health_sync.errors, status: :unprocessable_entity
    end
  end

  def update
    @health_sync = HealthSync.find(params[:id])
    if @health_sync.update(health_sync_params)
      render json: @health_sync
    else
      render json: @health_sync.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @health_sync = HealthSync.find(params[:id])
    @health_sync.destroy
    head :no_content
  end

  private

  def health_sync_params
    params.require(:health_sync).permit(:user_id, :health_data, :data_type, :synced_at)
  end
end
