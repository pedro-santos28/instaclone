module PostsHelper
  def hasLikedPost(post)
    if current_user
      if current_user.likes.find_by(likeable_id: post.id, likeable_type: "Post")
        true
      else
        false
      end
    end
  end
end
