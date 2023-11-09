class LikesController < ApplicationController

  before_action :get_comment
  before_action :get_post

  def post_likes_create
    @post.likes.create(user_id: current_user.id)
  end

  def post_likes_destroy
    @post.likes.where(user_id: current_user.id).delete_all
  end

  def comment_likes_create
    @comment.likes.create(user_id: current_user.id)
  end

  def comment_likes_destroy
    @comment.likes.where(user_id: current_user.id).delete_all
  end

  private
  def get_post
    @post = Post.find_by(id: params[:post_id])
  end
  def get_comment
    @comment = Comment.find_by(id: params[:comment_id])
  end
end
