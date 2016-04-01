defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    generator_palindromes(min_factor, max_factor)
    |> into_palindrome_map(%{})
  end

  defp into_palindrome_map([], acc), do: acc
  defp into_palindrome_map([[a, b] = factors | rest], map) do
    into_palindrome_map(rest, update_palindrome_map(factors, map))
  end

  def update_palindrome_map([a, b] = factors, map) do
    Map.update(map, a*b, [factors], fn(list) ->
      [factors | list] |> Enum.reverse
    end)
  end

  defp generator_palindromes(min, max) do
    for a <- (min..max),
        b <- (min..max),
        a <= b,
        palindrome?(a*b),
        do: [a, b]
  end

  def palindrome?(n) do
    list = n |> to_char_list
    list == (list |> Enum.reverse)
  end
end
