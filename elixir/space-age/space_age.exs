defmodule SpaceAge do
  @day_seconds (24 * 60 * 60)
  @year_days %{
    earth: 365.26,
    jupiter: 4_332.82,
    mars: 686.98,
    mercury: 87.97,
    neptune: 60_190.03,
    saturn: 10_755.70,
    uranus: 30_687.15,
    venus: 224.7
  }

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
  | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / Map.get(@year_days, planet) / @day_seconds
  end
end
