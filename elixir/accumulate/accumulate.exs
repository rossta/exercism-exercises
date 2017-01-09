defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    do_accumulate(list, fun, [])
  end

  defp do_accumulate([], fun, new_list), do: new_list
  defp do_accumulate([first|rest], fun, new_list) do
    do_accumulate(rest, fun, new_list ++ [fun.(first)])
  end
end
