class Api::V1::UsersController < ActionController::API
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created # 保存が成功した場合は201でJSONを返す
      else
        render json: @user.errors, status: :unprocessable_entity # 保存が失敗したららエラーメッセージを422で返す
      end
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      head :no_content # （204 No Content）を返す
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :height, :start_weight, :target_weight, :target_date, :theme_color, :avatar_image)
    end
  end
  