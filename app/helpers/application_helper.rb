module ApplicationHelper
  def logged_in?
    current_avatar.present?
  end

  def current_avatar
    avatar = Avatar.find_by(id: cookies[:avatar_id])
    avatar.present? ? avatar : nil
  end
end
