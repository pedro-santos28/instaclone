class LikesController < ApplicationController

  before_action :get_post, only: [:create, :destroy]

  def create
    if !params[:comment_id]
      @post = Post.find_by(id: params[:post_id])
      @post.likes.create(user_id: current_user.id)
    else
      @comment = Comment.find_by(id: params[:comment_id])
      @comment.likes.create(user_id: current_user.id)
    end
  end

  def destroy
    if !params[:comment_id]
      @post = Post.find_by(id: params[:post_id])
      @post.likes.where(user_id: current_user.id).delete_all
    else
      @comment = Comment.find_by(id: params[:comment_id])
      @comment.likes.where(user_id: current_user.id).delete_all
    end
  end

  private
    def get_post
      @post = Post.find_by(id: params[:post_id])
    end
end
