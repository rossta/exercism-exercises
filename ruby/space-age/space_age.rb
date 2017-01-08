class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds.to_f
  end

  # Generated methods:
  # Return age in years on referenced planet
  # given @seconds
  {
    on_earth: 365.25,
    on_mercury: 87.97,
    on_venus: 224.7,
    on_mars: 686.88,
    on_jupiter: 4331.98,
    on_saturn: 10_760.56,
    on_uranus: 30685.49,
    on_neptune: 60191.19
  }.each do |planet_method, revolution_days|

    define_method(planet_method) do
      days / revolution_days
    end
  end

  private

  SECONDS_IN_DAY = 60 * 60 * 24

  def days
    @days ||= @seconds / SECONDS_IN_DAY
  end
end
