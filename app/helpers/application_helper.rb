module ApplicationHelper

  def user_is_staff?
    current_user.staff?
  end

end
