class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  def index
    @posts = Post.all

    @list_of_posts = @posts.order({ :created_at => :desc })

    render({ :template => "posts/index" })
  end

  def show
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_back fallback_location: root_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to("/posts/#{@post.id}", notice: "Post updated successfully." ) }
      else
        format.html { redirect_to("/posts/#{@post.id}", alert: the_post.errors.full_messages.to_sentence )  }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
      
    @post.destroy

    redirect_to("/hobbies/#{@post.hobby_id}", { :notice => "Post deleted successfully."} )
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :likes_count, :hobby_id, :user_id, :content)
    end
end
