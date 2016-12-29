class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.downcase.scan(/[\w']+/).
      map { |w| w.gsub(/^'|'$/, "") }.
      group_by { |w| w }.
      each_with_object({}) do |(k, v), hash|
      hash[k] = v.size
    end
  end
end
