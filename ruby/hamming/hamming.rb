class Hamming
  VERSION = 2

  def self.compute(left, right)
    raise ArgumentError unless left.length == right.length

    char_pairs = left.chars.zip(right.chars)

    char_pairs.keep_if { |(a, b)| a != b }.count
  end
end
