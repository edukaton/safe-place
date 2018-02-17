class HomeController < ApplicationController
  def index
    if logged_in?
      @tasks = Task.all
    end
  end
end
