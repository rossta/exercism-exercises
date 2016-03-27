defmodule Allergies do
  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
  @max round :math.pow(2, length(@allergens))

  use Bitwise

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) when flags > @max, do: list(flags - @max)
  def list(flags) do
    @allergens
    |> Enum.with_index
    |> Enum.map(fn({key, index}) -> {key, round(:math.pow(2, index))} end)
    |> Enum.filter(fn({key, power}) -> (flags &&& power) === power end)
    |> Keyword.keys
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(0, _), do: false
  def allergic_to?(flags, item) do
    flags
    |> list
    |> Enum.any?(&(&1 == item))
  end
end
