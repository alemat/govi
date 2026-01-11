class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  # posts_controller.rb
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new   # <-- add this
  end


  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.turbo_stream # renders create.turbo_stream.erb
        format.html { redirect_to posts_path, notice: "Post created!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_post", partial: "form", locals: { post: @post }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      respond_to do |format|
        format.turbo_stream # see below
        format.html { redirect_to posts_path, notice: "Post updated!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@post), partial: "form", locals: { post: @post }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path, notice: "Post deleted!" }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :body ])
    end
end
