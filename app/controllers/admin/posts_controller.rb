class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post_categories, only: [:new, :create, :edit, :update]

  layout 'admin'

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
    @post_categories = PostCategory.all
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @post_categories = PostCategory.all
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_url(@post), notice: t('.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_posts_path, notice: t('.success') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_post_categories
      @post_categories = PostCategory.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      #params.fetch(:post, {}).permit(:title, :intro, :text).merge(params[:post_category_id])
      params.require(:post).permit(:post_category_id, :title, :intro, :text) #.merge(post_category_id: params[:post_category_id])
    end
end
