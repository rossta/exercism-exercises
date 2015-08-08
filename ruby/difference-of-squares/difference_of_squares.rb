class Squares
  def initialize(num)
    @num = num
  end

  # Based on formula:
  # http://www.trans4mind.com/personal_development/mathematics/series/sumNaturalNumbers.htm
  def square_of_sums
    (@num * (@num + 1) / 2) ** 2
  end

  # Given by formula:
  # http://www.trans4mind.com/personal_development/mathematics/series/sumNaturalSquares.htm
  def sum_of_squares
    (@num * (@num + 1) * (2 * @num + 1)) / 6
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
