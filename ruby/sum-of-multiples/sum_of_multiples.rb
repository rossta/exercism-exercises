class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    @factors
      .flat_map { |f| multiples_for(f, limit) }
      .uniq
      .reduce(0, &:+)
  end

  private

  def multiples_for(factor, limit)
    (factor...limit).step(factor).to_a
  end
end
