module Search
  class Result
    include ActiveModel::Model
    attr_accessor :description, :title, :url

    class << self
      def random
        [
          Search::Result.new(
            description: "Kup NAJTAŃSZE bilety na fily do kina LAGUNA kliknij tutaj aby kupic",
            title: "Bilety NAJTANIEJ - Kino Laguna",
            url: Domain.url(:malicious, :cinema, "/")),
          Search::Result.new(
            description: "Bieżący repertuar, rezerwacje biletów, wynajem sal, wydarzenia ze świata kinematografii. Kino Atlantic to różnorodne wydarzenia kulturalne oraz najnowsze premiery filmowe. Sprawdź aktualny repertuar i kup bilet on-line!",
            title: "Kino Laguna - seanse, bilety, zapowiedzi",
            url: Domain.url(:credible, :cinema, "/")),
          Search::Result.new(
            description: "Bilety do kina Laguna w najtańszej cenie!! MULTIKINO CINEMACITY NOVEKINO WIEZIEN LABIRYNTU CZARNA PANTERA FERNANDO GNOMY ROZRABIAJA",
            title: "BILETY DO KINA TANIO",
            url: Domain.url(:malicious, :cinema, "/"))
        ]
      end
    end
  end
end
