module Cinema
  class Movie
    include ActiveModel::Model
    attr_accessor :description, :image, :title

    POSTER_SIZE = "w500"

    class << self
      def random
        config = Cinema::TMDB.instance.configuration
        movies = Cinema::TMDB.instance.movies("sort_by" => "popularity.desc")

        image_base_url = config["images"]["base_url"]

        selected_movies = movies["results"][0..10].map do |movie|
          Movie.new(
            description: movie["overview"],
            image: [image_base_url, POSTER_SIZE, movie["poster_path"]].join,
            title: movie["title"]
          )
        end
      end
    end
  end
end
