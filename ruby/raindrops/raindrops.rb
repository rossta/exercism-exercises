class Raindrops
  def self.convert(n)
    response = ''
    response << 'Pling' if divisible? n, 3
    response << 'Plang' if divisible? n, 5
    response << 'Plong' if divisible? n, 7

    return n.to_s if response.length == 0

    response
  end

  def self.divisible?(m, n)
    m % n == 0
  end
end
