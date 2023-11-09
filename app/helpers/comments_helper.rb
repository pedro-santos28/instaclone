module CommentsHelper
  def hasLikedComment(comment)
    if current_user
      if current_user.likes.find_by(likeable_id: comment.id, likeable_type: "Comment")
        true
      else
        false
      end
    end
  end
end
