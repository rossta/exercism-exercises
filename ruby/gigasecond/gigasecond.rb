class Gigasecond
  VERSION = 1
  SECONDS = 1_000_000_000

  def self.from(time)
    Time.at(time.to_i + SECONDS)
  end
end
