class Robot

  ALPHABET = "A".upto("Z").to_a
  DIGITS = 0.upto(9).to_a

  attr_reader :name

  def initialize
    @used_names = []
    @name = generate_name
  end

  def reset
    @used_names << @name
    @name = generate_name while @used_names.include?(@name)
  end

  private

  def generate_name
    [
      ALPHABET.sample,
      ALPHABET.sample,
      DIGITS.sample,
      DIGITS.sample,
      DIGITS.sample
    ].join
  end
end
