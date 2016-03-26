defmodule Series do

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_, 0), do: 1
  def largest_product(number_string, size) when size < 0, do: raise ArgumentError
  def largest_product(number_string, size) when byte_size(number_string) < size,
    do: raise ArgumentError
  def largest_product(number_string, size) do
    number_string
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> max_cons_product(size, 0)
  end

  defp max_cons_product([], size, max), do: max
  defp max_cons_product(numbers, size, max) do
    cons(numbers, size)
    |> Enum.reduce(max, &calculate_max/2)
  end

  defp calculate_max(numbers, max) do
    product = Enum.reduce(numbers, &(&1 * &2))
    if product > max do
      product
    else
      max
    end
  end

  defp cons(list, count) when length(list) < count, do: []
  defp cons([_ | tail] = list, count),
    do: [Enum.take(list, count) | cons(tail, count)]
end
