class PhoneNumberNormalizer
  VALID_LENGTH = 10
  NON_ALPHANUMERIC_MATCH = /[^\w]+/
  VALID_DIGIT_MATCH = /^1?\d{#{VALID_LENGTH}}$/

  def normalize(input)
    normalize_input(input) or fallback_number
  end

  private

  def normalize_input(input)
    input = input.gsub(NON_ALPHANUMERIC_MATCH, "")

    return nil if !valid_digits?(input)

    normalize_valid_digits(input)
  end

  def normalize_valid_digits(input)
    start = input.length - VALID_LENGTH
    input[start..-1]
  end

  def fallback_number
    '0' * VALID_LENGTH
  end

  def valid_digits?(input)
    input =~ VALID_DIGIT_MATCH
  end
end

class PhoneNumber
  DEFAULT_NORMALIZER = PhoneNumberNormalizer.new

  def initialize(input, normalizer: DEFAULT_NORMALIZER)
    @input = input
    @normalizer = normalizer
  end

  def number
    @number ||= @normalizer.normalize(@input)
  end

  def to_s
    "(#{area_code}) #{prefix_part}-#{line_part}"
  end

  def area_code
    number[0...3]
  end

  private

  def prefix_part
    number[3...6]
  end

  def line_part
    number[6..10]
  end
end
