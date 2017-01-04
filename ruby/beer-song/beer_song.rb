class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map { |n| verse(n) }.join("\n")
  end

  def verse(count)
    "#{bottles(count).capitalize} of beer on the wall, #{bottles(count)} of beer.\n" \
      "#{what_to_do(count).capitalize}, #{bottles(count-1)} of beer on the wall.\n"
  end

  private

  def what_to_do(count)
    case count
    when 0
      "Go to the store and buy some more"
    when 1
      "Take it down and pass it around"
    else
      "Take one down and pass it around"
    end
  end

  def bottles(count)
    if count == 1
      "1 bottle"
    else
      "#{remaining(count)} bottles"
    end
  end

  def remaining(count)
    if count < 0
      "99"
    elsif count == 0
      "no more"
    else
      count
    end
  end
end

module BookKeeping
  VERSION = 2
end
