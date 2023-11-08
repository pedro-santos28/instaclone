class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.valid?
      @post.save
      flash[:notice] = "Your post has been just created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
