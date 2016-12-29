class Robot
  @@mutex = Mutex.new
  @@used_names = {}

  ALPHABET = "A".upto("Z").to_a
  DIGITS = 0.upto(9).to_a

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @@mutex.synchronize {
      loop do
        @name = generate_name
        break unless @@used_names.include?(@name)
      end
      @@used_names[@name] = true
    }
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
