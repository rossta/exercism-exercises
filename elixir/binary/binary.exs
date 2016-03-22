defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.to_char_list
    |> bit_sum
  end

  defp bit_sum(list), do: bit_sum(list, 0)
  defp bit_sum([], num), do: num
  defp bit_sum([?0 | tail], num), do: bit_sum(tail, num)
  defp bit_sum([?1 | tail], num), do: bit_sum(tail, num + :math.pow(2, length(tail)))
  defp bit_sum(_, _), do: 0
end
