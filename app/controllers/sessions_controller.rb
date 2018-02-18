class SessionsController < ApplicationController
  layout "sessions"

  def new
  end

  def create
    @avatar = Avatar.find_by(code: params[:session][:code])

    if @avatar.present?
      cookies[:avatar_id] = @avatar.id
      redirect_to root_path
    else
      flash[:error] = "Niepoprawny kod"
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:avatar_id)
    redirect_to root_path
  end
end