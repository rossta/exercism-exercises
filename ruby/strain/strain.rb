class Array
  def keep
    return to_enum(:keep) unless block_given?

    result = []
    index = 0
    while index < length
      result << self[index] if yield(self[index])
      index += 1
    end
    result
  end

  def discard(&block)
    return to_enum(:discard) unless block_given?

    self - keep(&block)
  end
end
