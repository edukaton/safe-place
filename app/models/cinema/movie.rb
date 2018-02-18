module Cinema
  class Movie < ActiveRecord::Base
    scope :popular, -> { order(popularity: :desc) }

    def image
      PosterConfig.instance.image_url(poster_path)
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
