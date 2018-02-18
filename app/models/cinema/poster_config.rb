module Cinema
  class PosterConfig < ActiveRecord::Base
    POSTER_SIZE = "w500"

    def image_url(poster_path)
      [secure_base_url, POSTER_SIZE, poster_path].join
    end

    class << self
      def instance
        @instance ||= PosterConfig.first
      end

      def import_tmdb
        config = Cinema::TMDB.instance.configuration
        PosterConfig.create!(
          base_url: config["images"]["base_url"],
          secure_base_url: config["images"]["secure_base_url"]
        )
      end
    end
  end
end
