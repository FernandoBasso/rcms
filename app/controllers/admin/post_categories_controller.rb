class Admin::PostCategoriesController < ApplicationController

  before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /post_categories
  # GET /post_categories.json
  def index
    @post_categories = PostCategory.all

    respond_to do |format|
      format.html
      format.json { render json: @post_categories }
    end
  end

  # GET /post_categories/1
  # GET /post_categories/1.json
  def show
    @post_category = PostCategory.find(params[:id])
    respond_to do |fmt|
      fmt.html
      fmt.json { render json: @post_category }
    end
  end

  # GET /post_categories/new
  def new
    @post_category = PostCategory.new
  end

  # GET /post_categories/1/edit
  def edit
  end

  # POST /post_categories
  # POST /post_categories.json
  def create
    @post_category = PostCategory.new(post_category_params)

    respond_to do |format|
      if @post_category.save
        format.html { redirect_to admin_post_category_path(@post_category), notice: t('.success') }
        format.json { render :show, status: :created, location: @post_category }
      else
        format.html { render :new }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_categories/1
  # PATCH/PUT /post_categories/1.json
  def update
    respond_to do |format|
      if @post_category.update(post_category_params)
        format.html { redirect_to admin_post_category_path(@post_category), notice: t('.success') }
        format.json { render :show, status: :ok, location: @post_category }
      else
        format.html { render :edit }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_categories/1
  # DELETE /post_categories/1.json
  def destroy
    @post_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_categories_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_category_params
      params.require(:post_category).permit(:title, :description, :slug)
    end
end

