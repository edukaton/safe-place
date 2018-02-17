module Search
  class Result
    include ActiveModel::Model
    attr_accessor :description, :title, :url

    class << self
      def random
        [
          Search::Result.new(
            description: "Kup NAJTAŃSZE bilety na fily do kina LUNA kliknij tutaj aby kupic",
            title: "Bilety NAJTANIEJ - Kino Luna",
            url: "http://kyno.pl"),
          Search::Result.new(
            description: "Bieżący repertuar, rezerwacje biletów, wynajem sal, wydarzenia ze świata kinematografii. Kino Atlantic to różnorodne wydarzenia kulturalne oraz najnowsze premiery filmowe. Sprawdź aktualny repertuar i kup bilet on-line!",
            title: "Kino Luna - seanse, bilety, zapowiedzi",
            url: "http://kino.pl"),
          Search::Result.new(
            description: "Bilety do kina Luna w najtańszej cenie!! MULTIKINO CINEMACITY NOVEKINO WIEZIEN LABIRYNTU CZARNA PANTERA FERNANDO GNOMY ROZRABIAJA",
            title: "BILETY DO KINA TANIO",
            url: "http://kyno.pl")
        ]
      end
    end
  end
end
