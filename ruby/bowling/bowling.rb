class Game
  BowlingError = Class.new(StandardError)
  PINS = (0..10)

  attr_reader :frames

  def initialize
    @frames = Frame.new(nil)
  end

  def roll(pin)
    raise BowlingError unless PINS.include?(pin)
    raise BowlingError if @frames.misscored?(pin)

    @frames = @frames.add(pin)
  end

  def score
    raise BowlingError unless @frames.finished?

    @frames.score_all
  end
end

class Frame
  attr_accessor :head, :tail
  attr_reader :number, :scores

  def initialize(head)
    @head = head
    @tail = nil
    @number = head ? head.number + 1 : 1
    @scores = []
  end

  def add(pin)
    tally(pin)

    @head.add(pin) if @head

    case
    when last?
      self
    when rolled?
      self.tail = next_frame
    else
      self
    end
  end

  def score_all
    head_score = @head ? @head.score_all : 0
    head_score + score
  end

  def misscored?(pin)
    if last?
      return false if spare?
      return true if open?
      bonus = @scores.drop(1)
      return false if strike?(bonus.first)
      return score(bonus + [pin]) > 10
    end

    return false if length > 1
    return false if strike?

    score(@scores.take(1) + [pin]) > 10
  end

  def finished?
    last? && scored?
  end

  private

  def length
    @scores.length
  end

  def strike?(pin = @scores.first)
    pin == 10
  end

  def spare?
    !strike? && score(@scores.take(2)) == 10
  end

  def open?
    pair? && score < 10
  end

  def rolled?
    pair? || strike? || spare?
  end

  def pair?
    length == 2
  end

  def scored?
    length == 3 || open?
  end

  def score(scores = @scores)
    scores.reduce(&:+) || 0
  end

  def last?
    number == 10
  end

  def next_frame
    self.tail || Frame.new(self)
  end

  def tally(pin)
    return if scored?

    if open?
      @scores << 0
    else
      @scores << pin
    end
  end
end

module BookKeeping
  VERSION = 3
end
