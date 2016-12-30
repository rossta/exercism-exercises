class RunLengthEncoding

  # Encodes string as string of number-letter pairs
  # where number represents consective count of
  # the corresponding letter
  def self.encode(input)
    input.
      each_char.
      chunk_while { |a, b| a == b }.
      map { |chars| collapse_chars(chars) }.
      join
  end

  # Decodes run-length encoded string into
  # expanded string
  def self.decode(input)
    input.
      each_char.
      slice_when { |a, b| !a.match(/\d/) }.
      map { |chars| expand_chars(chars) }.
      join
  end

  # Collapses array of repeated characters
  # ['A', 'A', 'A'] => '3A'
  # ['B'] => 'B'
  def self.collapse_chars(chars)
    letter, *rest = chars
    count = chars.size
    return letter if rest.empty?
    count.to_s + letter
  end

  # Expands encoded array chunk
  # ['1', '2', 'A'] => 'AAAAAAAAAAAA'
  # ['B'] => 'B'
  def self.expand_chars(chars)
    *numbers, letter = chars
    return letter if numbers.empty?
    count = numbers.join.to_i
    letter * count
  end

  private_class_method :collapse_chars, :expand_chars
end

module BookKeeping
  VERSION = 2
end
