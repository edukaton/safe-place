class HomeController < ApplicationController
  def index
    if logged_in?
      @participations = Participation.where(avatar_id: current_avatar.id)
    end
  end
end
