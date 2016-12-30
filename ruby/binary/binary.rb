class Binary
  def self.to_decimal(input)
    raise ArgumentError, "Input must contain only 0 and 1" unless input.match(/^[01]+$/)
    return input.to_i if input.length == 1

    input
      .split('')
      .reverse
      .each_with_index
      .select { |(digit, _factor)| digit == '1' }
      .map { |(_digit, factor)| 2**factor }
      .reduce(&:+)
  end
end

module BookKeeping
  VERSION = 3
end
