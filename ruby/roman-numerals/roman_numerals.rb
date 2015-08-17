class Fixnum

  ROMAN_NUMERALS = {
    1     => "I",
    4     => "IV",
    5     => "V",
    9     => "IX",
    10    => "X",
    40    => "XL",
    50    => "L",
    90    => "XC",
    100   => "C",
    400   => "CD",
    500   => "D",
    900   => "CM",
    1_000 => "M"
  }

  def to_roman
    num = self
    str = ""
    while num > 0
      key = ROMAN_NUMERALS.keys.select { |n| num >= n }.max
      str << ROMAN_NUMERALS[key]
      num -= key
    end
    str
  end
end
