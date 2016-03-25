defmodule Allergies do
  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
  @max round :math.pow(2, length(@allergens))

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) when flags > @max, do: list(flags - @max)
  def list(flags) do
    flags
    |> do_list([])
  end

  defp do_list(0, allergies), do: allergies
  defp do_list(flags, allergies) do
    power = round Float.floor(:math.log2(flags))
    product = round :math.pow(2, power)
    do_list(flags - product, [Enum.at(@allergens, power) | allergies])
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(0, _), do: false
  def allergic_to?(flags, item) do
    flags
    |> list
    |> Enum.into(HashSet.new)
    |> Set.member?(item)
  end
end
