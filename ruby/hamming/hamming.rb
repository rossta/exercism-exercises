class Hamming
  VERSION = 2

  def self.compute(left, right)
    raise ArgumentError unless left.length == right.length

    left.each_char.with_index.count { |a, i| a != right[i] }
  end
end
