defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number) do
    [prime] = smallest_prime_factor(number)
    [prime] ++ factors_for(div(number, prime))
  end

  defp smallest_prime_factor(number) do
    Stream.unfold(2, fn(n) -> {n, n+1} end)
    |> Stream.filter(&(prime_factor? number, &1))
    |> Enum.take(1)
  end

  defp prime_factor?(number, candidate) do
    rem(number, candidate) == 0 && prime?(candidate)
  end

  def prime?(number) do
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
