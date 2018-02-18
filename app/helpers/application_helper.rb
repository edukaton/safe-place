module ApplicationHelper
  def logged_in?
    current_avatar.present?
  end

  def current_avatar
    avatar = Avatar.find_by(id: cookies[:avatar_id])
    avatar.present? ? avatar : nil
  end

  def format_card_number(card_number)
    match = card_number.match(/(\d{4})(\d{4})(\d{4})(\d{4})/)

    "#{match[1]} #{match[2]} #{match[3]} #{match[4]}"
  end
end
