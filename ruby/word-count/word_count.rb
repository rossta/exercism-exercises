module Histogram
  module_function

  def count(items)
    items.each_with_object(Hash.new(0)) do |item, counts|
      counts[item] += 1
    end
  end
end

class Phrase
  WORD_MATCH = /([\w]+('[\w]+)?)/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @word_count ||= Histogram.count(words)
  end

  private

  def words
    @words ||= @phrase.downcase.scan(WORD_MATCH).map(&:first)
  end
end

module BookKeeping
  VERSION = 1
end
