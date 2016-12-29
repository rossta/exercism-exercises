module Year
  module_function

  def leap?(year)
    year % 4 == 0 && (year % 400 == 0 || year % 100 != 0)
  end
end

module BookKeeping
  VERSION = 2
end
