module Prime
  module_function

  def nth(number)
    raise ArgumentError, "Number must be greater than zero" if number < 1
    return 2 if number < 2

    current = 1
    candidate = 2
    while current < number
      candidate += 1
      current += 1 if prime?(candidate)
    end
    candidate
  end

  def prime?(number)
    !!2.upto(Math.sqrt(number).floor).each do |i|
      return false if number % i == 0
    end
  end
end

module BookKeeping
  VERSION = 1
end
