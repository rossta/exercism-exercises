class Series
  def initialize(input)
    @input = input
  end

  def slices(size)
    raise ArgumentError,
      "Given size #{size} cannot be great than input length #{@input.length}" if size > @input.length

    @input
      .each_char
      .map(&:to_i)
      .each_cons(size)
      .to_a
  end
end
