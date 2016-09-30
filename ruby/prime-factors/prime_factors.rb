class PrimeFactors
  def self.for(n)
    for_results(n, [])
  end

  def self.for_results(n, results)
    return results if n < 2
    return results + [n] if n < 4

    2.upto(n).each do |div|
      return for_results(n / div , results + [div]) if n % div == 0
    end
  end
end
