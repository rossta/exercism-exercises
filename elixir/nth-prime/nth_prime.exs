defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise ArgumentError
  def nth(1), do: 2
  def nth(count) do
    Stream.unfold(1, &({&1, &1+2}))
    |> Stream.filter(&prime?/1)
    |> Stream.drop(count-1)
    |> Enum.take(1)
    |> Enum.at(0)
  end

  defp prime?(number) do
    all_factors(number) == [1]
  end

  defp all_factors(number) do
    all_factors(number, round(:math.sqrt(number)))
  end
  defp all_factors(number, 1), do: [1]
  defp all_factors(number, divisor) when rem(number, divisor) == 0 do
    [divisor|all_factors(number, divisor-1)]
  end
  defp all_factors(number, divisor), do: all_factors(number, divisor-1)
end
