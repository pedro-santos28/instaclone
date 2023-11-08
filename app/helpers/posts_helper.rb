module PostsHelper
  def checkIfUserHasLiked(post)
    if current_user.present? && post.likes.present?
      post.likes.each do |like|
        if like.user_id == current_user.id
          return true
        end
      end
    end
    return nil
  end
end
