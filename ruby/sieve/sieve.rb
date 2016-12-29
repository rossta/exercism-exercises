class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2

    sieve(2.upto(@limit).to_a)
  end

  private

  def sieve(range, primes = [])
    return primes if range.empty?

    div, *rest = range
    sieve rest.reject { |n| n % div == 0 }, primes << div
  end
end

module BookKeeping
  VERSION = 1
end
