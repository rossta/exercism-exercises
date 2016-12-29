module Grains
  module_function

  def square(number)
    2**(number-1)
  end

  def total
    2 * square(64) - 1
  end
end
