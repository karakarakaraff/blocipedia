module WikisHelper
  def user_is_authorized_for_edit?
    current_user
  end

  def user_is_authorized_for_private?
    current_user.premium? || current_user.admin?
  end

  def user_is_authorized_for_collaborator_edit?
    @wiki.user || current_user.admin?
  end

  def user_is_authorized_for_delete?
    current_user.admin?
  end

  def user_has_wikis?
    @user.wikis.any?
  end

  def wiki_has_collaborators?
    @wiki.collaborators.any?
  end

  def wiki_privacy_notice(wiki)
    if wiki.private
      "PRIVATE: #{wiki.title}"
    else
      wiki.title
    end
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content)
  end

end
