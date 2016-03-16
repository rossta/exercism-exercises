defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, [_|tail_b] = b) do
    lists_match?(a, b) or sublist?(a, tail_b)
  end

  defp lists_match?([], _), do: true
  defp lists_match?([a|tail_a], [a|tail_b]) do
    lists_match?(tail_a, tail_b)
  end
  defp lists_match?(_, _), do: false
end
