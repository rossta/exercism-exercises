defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten(list, [])
  end

  defp do_flatten([], result), do: result
  defp do_flatten([first | rest] = list, result) when is_list(first) do
    do_flatten(rest, result ++ do_flatten(first, []))
  end
  defp do_flatten([first | rest] = list, result) when is_nil(first) do
    do_flatten(rest, result)
  end
  defp do_flatten([first | rest] = list, result) do
    do_flatten(rest, result ++ [first])
  end
end
