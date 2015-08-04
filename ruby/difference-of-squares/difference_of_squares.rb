class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sums
    square.call sum(sequence)
  end

  def sum_of_squares
    sum sequence.map(&square)
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  def sequence
    (1..@num)
  end

  def sum(seq)
    seq.reduce(&:+)
  end

  def square
    ->(n) { n * n }
  end
end
