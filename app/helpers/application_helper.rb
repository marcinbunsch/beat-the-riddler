module ApplicationHelper

  def user_is_staff?
    current_user.staff?
  end

  def markdown(string)
    raw Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true).render(string)
  end

end
