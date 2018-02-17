class CinemaController < ApplicationController
  def index
    @date = Date.parse(params[:date]) rescue Time.zone.today
    @days = (@date - 3.days)..(@date + 3.days)
    @showtimes = Cinema::Showtimes.generate
    @movies = Cinema::Movie.popular
  end

  def showtime
    @movie = Cinema::Movie.find(params[:movie_id])
    @showtime = Time.zone.at(params[:showtime].to_i)
  end
end
