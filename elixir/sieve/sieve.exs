defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    Stream.unfold(2, &({&1, &1+1}))
    |> Stream.filter(&prime?/1)
    |> Enum.take_while(&(&1 < limit))
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
