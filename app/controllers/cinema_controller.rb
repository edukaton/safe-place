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

  def buy_ticket
    @movie = Cinema::Movie.find(params[:movie_id])
    @order = Order.create(
      movie_id: @movie.id,
      reference: SecureRandom.alphanumeric,
      paid: false,
      amount: 3000
    )
  end

  def confirm_ticket
    @order = Order.find_by(id: params[:id])
  end
end
