class LikesController < ApplicationController

  def create
    @post = Post.find_by(id: params[:post_id])
    puts @post.id
    current_user.like!(@post)
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:post_id])
    puts @post.inspect
    current_user.likes.where(post_id: @post.id).delete_all
  end

end
