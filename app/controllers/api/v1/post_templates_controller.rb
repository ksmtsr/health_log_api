class Api::V1::PostTemplatesController < ActionController::API
  def index
    @post_templates = PostTemplate.all
    render json: @post_templates
  end

  def show
    @post_template = PostTemplate.find(params[:id])
    render json: @post_template
  end

  def create
    @post_template = PostTemplate.new(post_template_params)
    if @post_template.save
      render json: @post_template, status: :created
    else
      render json: @post_template.errors, status: :unprocessable_entity
    end
  end

  def update
    @post_template = PostTemplate.find(params[:id])
    if @post_template.update(post_template_params)
      render json: @post_template
    else
      render json: @post_template.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post_template = PostTemplate.find(params[:id])
    @post_template.destroy
    head :no_content
  end

  private

  def post_template_params
    params.require(:post_template).permit(:user_id, :content, :hashtags)
  end
end
