class CinemaController < ApplicationController
  def index
    @movies = Cinema::Movie.random
  end
end
