class Binary
  def self.to_decimal(input)
    raise ArgumentError, "Input must contain only 0 and 1" unless input.match(/^[01]+$/)

    input
      .split('')
      .reverse
      .each_with_index
      .map { |digit, factor| digit.to_i * 2**factor }
      .reduce(&:+)
  end
end

module BookKeeping
  VERSION = 3
end
