class Array
  def accumulate
    return to_enum(:accumulate) unless block_given?

    arr = []
    i = 0
    while i < self.length
      arr << yield(self[i])
      i += 1
    end
    arr
  end
end

module BookKeeping
  VERSION = 1
end
