class Bst
  VERSION = 1
  EMPTY = :__EMPTY__

  attr_reader :data

  def initialize(data = EMPTY)
    @data = data
  end

  def insert(new_data)
    return @data = new_data if empty?

    if new_data <= @data
      left.insert(new_data)
    else
      right.insert(new_data)
    end
  end

  def each(&block)
    return to_enum(__method__) unless block_given?

    left.each(&block) unless left.empty?
    block.call(data)
    right.each(&block) unless right.empty?
  end

  def left
    @left ||= Bst.new
  end

  def right
    @right ||= Bst.new
  end

  def empty?
    data == EMPTY
  end
end
