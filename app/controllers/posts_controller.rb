class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  def index
    matching_posts = Post.all

    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts/index" })
  end

  def show
    
    # the_id = params.fetch("path_id")

    # matching_posts = Post.where({ :id => the_id })

    # @the_post = matching_posts.at(0)

    # render({ :template => "posts/show" })
  end

  def create
    the_post = Post.new
    the_post.user_id = params.fetch("query_user_id")
    the_post.hobby_id = params.fetch("query_hobby_id")
    the_post.body = params.fetch("query_body")

    if the_post.valid?
      the_post.save
      redirect_to("/hobbies/#{the_post.hobby_id}", { :notice => "Post created successfully." })
    else
      redirect_to("/hobbies/#{the_post.hobby_id}", { :alert => the_post.errors.full_messages.to_sentence })
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

  def destroy
      
    @post.destroy

    redirect_to("/hobbies/#{@post.hobby_id}", { :notice => "Post deleted successfully."} )
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :body, :likes_count, :hobby_id, :user_id)
    end
end
