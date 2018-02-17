module Cinema
  class Movie
    include ActiveModel::Model
    attr_accessor :description, :id, :image, :title

    POSTER_SIZE = "w500"

    class << self
      def find(id)
        movie = Cinema::TMDB.instance.movie(id)

        Movie.new(
          description: movie["overview"],
          id: movie["id"],
          image: image(movie["poster_path"]),
          title: movie["title"]
        )
      end

      def popular
        movies = Cinema::TMDB.instance.movies("sort_by" => "popularity.desc")
        movies["results"][0..10].map do |movie|
          Movie.new(
            description: movie["overview"],
            id: movie["id"],
            image: image(movie["poster_path"]),
            title: movie["title"]
          )
        end
      end

      def image(poster_path)
        config = Cinema::TMDB.instance.configuration
        image_base_url = config["images"]["base_url"]
        [image_base_url, POSTER_SIZE, poster_path].join
      end
    end
  end
end
