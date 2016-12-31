class PhoneNumberNormalizer
  REQUIRED_LENGTH = 10
  INVALID_CHARACTER_MATCH = %r{[^-\.\(\)\s\d]+}
  NON_NUMBER_MATCH = %r{[^\d]}
  VALID_EXTERNAL_MATCH = %r{^1(\d{10})}

  def normalize(input)
    return fallback_number if invalid_characters?(input)

    number = normalize_digits(input)

    return fallback_number if invalid_length?(number)

    normalize_external_number(number)
  end

  private

  def fallback_number
    '0' * REQUIRED_LENGTH
  end

  def normalize_external_number(input)
    input.gsub(VALID_EXTERNAL_MATCH, '\1')
  end

  def invalid_characters?(input)
    input =~ INVALID_CHARACTER_MATCH
  end

  def normalize_digits(input)
    input.gsub(NON_NUMBER_MATCH, "")
  end

  def valid_external_number?(input)
    input.length == REQUIRED_LENGTH + 1 &&
      external_number?(input)
  end

  def external_number?(input)
    input.start_with?("1")
  end

  def invalid_length?(input)
    input.length != REQUIRED_LENGTH &&
      !valid_external_number?(input)
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
