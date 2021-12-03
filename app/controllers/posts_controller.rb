class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_post, only: %i[ show edit update destroy ]

  def comment_action
    if signed_in?
      me = current_user
      post = Post.find(params[:id])
      comment = params[:comment]
      post.comments.each do |comment|
        comment.destroy
      end
      new_comment = Comment.create(comment: comment, post_id: post.id, user_id: me.id)
      
      new_comment.save
      #Creando la notificacion
      Notification.create(recipient_id: post.user.id, actor: current_user, action: "comentado", notifiable: post)
      respond_to do |format|
        format.json { render json: { comment: JSON.parse(render_to_string('comments/_comment', layout: false, locals: { comment: new_comment})) } }
      end
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts or /posts.json
  def index
    @posts = Post.all
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

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "#{t 'activerecord.successful.messages.created.default'}" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "#{t 'activerecord.successful.messages.updated'}" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: "/") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :body, :img_file)
    end
end
