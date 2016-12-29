module Prime
  module_function

  def nth(number)
    raise ArgumentError, "Argument must be greater than zero but was #{number}" if number < 1
    return 2 if number == 1

    count = 1
    candidate = 1
    while count < number
      candidate += 2
      count += 1 if prime?(candidate)
    end
    candidate
  end

  def prime?(number)
    3.upto(Math.sqrt(number).floor).none? do |i|
      number % i == 0
    end
  end
end

module BookKeeping
  VERSION = 1
end
