class Bob
  def self.hey(remark)
    case
    when silent?(remark)
      "Fine. Be that way!"

    when shouting?(remark)
      "Whoa, chill out!"

    when asking?(remark)
      "Sure."

    else
      "Whatever."
    end
  end

  def self.silent?(remark)
    remark.strip.empty?
  end

  def self.asking?(remark)
    remark.end_with?("?")
  end

  def self.shouting?(remark)
    remark.upcase == remark && letters?(remark)
  end

  def self.letters?(remark)
    remark.match(/[A-Za-z]+/)
  end
end
