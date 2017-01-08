class SpaceAge
  REVOLUTION_DAYS = {
    earth: 365.25,
    mercury: 87.97,
    venus: 224.7,
    mars: 686.88,
    jupiter: 4331.98,
    saturn: 10_760.56,
    uranus: 30685.49,
    neptune: 60191.19
  }

  def initialize(seconds)
    @seconds = seconds.to_f
  end

  def seconds
    @seconds
  end

  def on_earth
    revolutions :earth
  end

  def on_mercury
    revolutions :mercury
  end

  def on_venus
    revolutions :venus
  end

  def on_mars
    revolutions :mars
  end

  def on_jupiter
    revolutions :jupiter
  end

  def on_saturn
    revolutions :saturn
  end

  def on_uranus
    revolutions :uranus
  end

  def on_neptune
    revolutions :neptune
  end

  private

  def revolutions(planet)
    round days / REVOLUTION_DAYS[planet]
  end

  def days
    @days ||= @seconds / 60 / 60 / 24
  end

  def round(float)
    float.round(4)
  end
end
