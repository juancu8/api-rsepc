class PostsController < ApplicationController
  # concern method for auth
  include Secured
  before_action :authenticate_user!, only: [:create, :update]

  rescue_from  Exception do |e|
    #log.error"#{ e.message}"
    render json: {error: e.message}, status: :internal_error #500
  end

  rescue_from  ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  # Priority exception
  rescue_from  ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /posts
  def index
    @posts = Post.where(published: true)
    if !params[:search].nil? && params[:search].present?
      @posts = PostSearchService.search(@posts, params[:search])
    end
    render json: @posts.includes(:user), status: :ok
  end

  # GET /posts/{id}
  def show
    @post = Post.find(params[:id])
    if ( @post.published? || (Current.user && @post.user_id == Current.user.id) )
      render json: @post, status: :ok
    else
      render json: {error: 'Not found'}, status: :not_found
    end
  end

  # POST /posts
  def create
    @post = Current.user.post.create!(create_params)
    render json: @post, status: :created
  end

  # PUT /posts/{id}
  def update
    @post = Current.user.post.find(params[:id])
    @post.update!(update_params)
    render json: @post, status: :ok
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :published)
  end

  def update_params
    params.require(:post).permit(:title, :content, :published)
  end
end