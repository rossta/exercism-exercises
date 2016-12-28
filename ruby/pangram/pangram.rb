require 'set'

module Pangram
  module_function

  ALPHABET = "a".upto("z").to_a

  def pangram?(phrase)
    Set.new(phrase.downcase.scan(/[A-Za-z]/)).size == ALPHABET.length
  end
end

module BookKeeping
  VERSION = 3
end
