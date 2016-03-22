defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if Regex.match?(~r/^[0|1]*$/, string) do
      string |> String.to_char_list |> bit_sum
    else
      0
    end
  end

  defp bit_sum([?0 | tail]), do: bit_sum(tail)
  defp bit_sum([?1 | tail]), do: power(length(tail)) + bit_sum(tail)
  defp bit_sum(_), do: 0

  defp power(0), do: 1
  defp power(num), do: 2 * power(num - 1)
end
