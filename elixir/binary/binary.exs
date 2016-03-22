defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    Regex.replace(~r/^.*\p{L}.*$/, string, "")
    |> String.to_char_list
    |> bit_sum
  end

  defp bit_sum([?0 | tail]), do: bit_sum(tail)
  defp bit_sum([?1 | tail]), do: :math.pow(2, length(tail)) + bit_sum(tail)
  defp bit_sum(_), do: 0
end
