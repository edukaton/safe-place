module Cinema
  class Movie < ActiveRecord::Base
    POSTER_SIZE = "w500"

    scope :popular, -> { order(popularity: :desc) }

    def image
      config = Cinema::TMDB.instance.configuration
      image_base_url = config["images"]["base_url"]
      [image_base_url, POSTER_SIZE, poster_path].join
    end

    class << self
      def import_tmdb
        movies = Cinema::TMDB.instance.movies["results"].map do |movie|
          next if movie["poster_path"].nil?

          Movie.new(
            description: movie["overview"],
            id: movie["id"],
            poster_path: movie["poster_path"],
            popularity: movie["popularity"],
            title: movie["title"]
          )
        end.compact

        Movie.import movies
      end
    end
  end
end
