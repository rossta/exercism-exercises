defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, []), do: 0
  def to(limit, multiples) do
    all_multiples(limit-1, multiples)
    |> Enum.uniq
    |> Enum.sum
  end

  defp all_multiples(limit, []), do: []
  defp all_multiples(limit, [head | tail]) do
    all_multiples(limit, tail) ++ do_multiples(limit, head, [])
  end

  defp do_multiples(limit, base, multiples) when limit < base, do: multiples
  defp do_multiples(limit, base, multiples) do
    multiple = div(limit, base) * base
    do_multiples(multiple - base, base, [multiple | multiples])
  end
end
