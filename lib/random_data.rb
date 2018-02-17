class RandomData
  include Singleton

  def initialize
    load_cities
    load_female_names
    load_male_names
    load_last_names
    load_streets

    nil
  end

  def generate(gender)
    {
      first_name: sample_first_name(gender),
      last_name: sample_last_name(gender),
      city: sample_city(gender),
      postal_code: sample_postal_code(gender),
      address: sample_address(gender),
      card_number: sample_card_number(gender),
      card_cvv: sample_card_cvv(gender),
      card_expire_month: sample_card_expire_month(gender),
      card_expire_year: sample_card_expire_year(gender)
    }
  end

  def inspect
    "RandomData"
  end

  private

  def sample_first_name(gender)
    if gender == :male
      @male_names.sample
    else
      @female_names.sample
    end
  end

  def sample_last_name(gender)
    name = @last_names.sample

    if gender == :female && name[-1] == "i"
      name[-1] = "a"
    end

    name
  end

  def sample_city(gender)
    @cities.sample
  end

  def sample_address(gender)
    street = @streets.sample
    number = (1..300).to_a.sample

    "#{street} #{number}"
  end

  def sample_postal_code(gender)
    "#{(10..99).to_a.sample}-#{(100..999).to_a.sample}"
  end

  def sample_card_number(gender)
    type = ["mastercard", "visa", "visa-electron"].sample
    object = Credy::CreditCard.generate type: type
    object[:number]
  end

  def sample_card_cvv(gender)
    (100..999).to_a.sample
  end

  def sample_card_expire_month(gender)
    (1..12).to_a.sample
  end

  def sample_card_expire_year(gender)
    Time.zone.now.year + rand(5) + 1
  end

  def load_cities
    @cities = File.
      readlines(Rails.root.join("lib/data/cities.txt")).
      map(&:strip)
  end

  def load_female_names
    @female_names = File.
      readlines(Rails.root.join("lib/data/female-names.txt")).
      map(&:strip)
  end

  def load_male_names
    @male_names = File.
      readlines(Rails.root.join("lib/data/male-names.txt")).
      map(&:strip)
  end

  def load_last_names
    @last_names = File.
      readlines(Rails.root.join("lib/data/last-names.txt")).
      map(&:strip)
  end

  def load_streets
    @streets = File.
      readlines(Rails.root.join("lib/data/streets.txt")).
      map(&:strip)
  end
end