module TopicsHelper

  def user_is_authorized_to_create_destroy_topics?
     current_user && current_user.admin?
  end

  def user_is_authorized_to_edit_topics?
     (current_user && current_user.admin?) || (current_user && current_user.moderator?)
  end

end
