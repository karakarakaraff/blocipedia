module WikisHelper
  def user_is_authorized_for_edit?
    current_user
  end

  def user_is_authorized_for_delete?
    current_user.admin?
  end
end
