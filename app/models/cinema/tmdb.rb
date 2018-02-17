require "net/http"

module Cinema
  class TMDB
    include Singleton

    API_KEY = ENV["TMDB_API_KEY"]
    BASE_URL = "https://api.themoviedb.org/3"

    def movies(params = {})
      date_from = Time.zone.today - 2.weeks
      date_to = Time.zone.today
      url = make_url("/discover/movie", params.merge({
        "primary_release_date.gte" => date_from.to_s,
        "primary_release_date.lte" => date_to.to_s,
        "language" => "pl"
      }))
      get_json(url)
    end

    def configuration
      @configuration ||= begin
        url = make_url("/configuration")
        get_json(url)
      end
    end

    private

    def make_url(path, query = {})
      query_string = "?" + query.
        merge({ "api_key" => API_KEY }).
        map { |k, v| [k, v].join("=") }.
        join("&")

      [BASE_URL, path, query_string].join
    end

    def get_json(url)
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end
end
