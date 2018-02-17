module Cinema
  class Showtimes
    OPENING = 14
    CLOSING = 23

    class << self
      def generate
        start_time = Time.zone.now.beginning_of_day
        showtimes = []

        (OPENING..CLOSING).each do |hour|
          4.times do |quarter|
            showtimes << start_time + hour.hours + (quarter * 15.minutes)
          end
        end

        showtimes
      end
    end
  end
end
