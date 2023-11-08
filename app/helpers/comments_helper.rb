module CommentsHelper
  def checkIfUserHasLiked(comment)
    if current_user.present? && comment.likes.present?
      comment.likes.each do |like|
        if like.user_id == current_user.id
          return true
        end
      end
    end
    return nil
  end
end
