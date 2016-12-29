class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes ||= sieve_primes
  end

  private

  def sieve_primes
    return [] if @limit < 2

    primes = []
    range = 2.upto(@limit).to_a

    while range.any?
      div, *rest = range
      primes << div
      primes = []
      range = rest.reject { |n| n % div == 0 }
    end

    primes
  end
end

module BookKeeping
  VERSION = 1
end
