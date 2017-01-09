class Anagram
  def initialize(word)
    @word = word
    @normalized = normalize @word
    @sorted = sort @normalized
  end

  def match(candidates)
    candidates.select { |w| anagram?(w) }
  end

  private

  def anagram?(candidate)
    candidate = normalize candidate
    @normalized != candidate && @sorted == sort(candidate)
  end

  def normalize(word)
    word.downcase
  end

  def sort(word)
    word.chars.sort
  end
end

module BookKeeping
  VERSION = 2
end
