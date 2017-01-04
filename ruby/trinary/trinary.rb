class Trinary
  TRINARY_MATCH = /\A[0-2]+$/

  def initialize(input)
    @input = input
  end

  def to_decimal
    return 0 unless trinary?

    @input
      .split('')
      .reverse
      .each_with_index
      .map { |digit, factor| digit.to_i * 3**factor }
      .reduce(&:+)
  end

  def trinary?
    @input =~ TRINARY_MATCH
  end
end

module BookKeeping
  VERSION = 1
end
