defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(n) do
    factors_for(n, 2)
  end

  def factors_for(n, factor) when rem(n, factor) == 0 do
    [factor | factors_for(div(n, factor))]
  end
  def factors_for(n, 2), do: factors_for(n, 3)
  def factors_for(n, factor), do: factors_for(n, factor + 2)
end
