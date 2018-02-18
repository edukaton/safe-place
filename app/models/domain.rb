class Domain
  DOMAINS = {
    credible: {
      cinema: ENV.fetch("CINEMA_DOMAIN"),
      payments: ENV.fetch("PAYMENTS_DOMAIN"),
      search: ENV.fetch("SEARCH_DOMAIN")
    },
    malicious: {
      cinema: ENV.fetch("MALICIOUS_CINEMA_DOMAIN"),
      payments: ENV.fetch("MALICIOUS_PAYMENTS_DOMAIN"),
      search: ENV.fetch("MALICIOUS_SEARCH_DOMAIN")
    }
  }

  class << self
    def credible(name)
      DOMAINS[:credible][name]
    end

    def malicious(name)
      DOMAINS[:malicious][name]
    end

    def url(type, name, path = "/")
      raise "Invalid type #{type}" unless type.in?(DOMAINS.keys)

      protocol = if Rails.env.production? && type == :credible
                   "https"
                 else
                    "http"
                 end
      port = if Rails.env.development?
               ":3000"
             else
               ""
             end

      "#{protocol}://#{DOMAINS[type][name]}#{port}#{path}"
    end
  end
end
