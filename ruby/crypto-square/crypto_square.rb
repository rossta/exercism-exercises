class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ')
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^\w]/, "")
  end

  def plaintext_segments
    normalize_plaintext
      .chars
      .each_slice(size)
      .map(&:join)
  end

  def size
    length = normalize_plaintext.length
    Math.sqrt(length).ceil
  end

  private

  def ciphertext_segments
    first, *rest = plaintext_segments.map(&:chars)

    first.zip(*rest).map(&:join)
  end
end
