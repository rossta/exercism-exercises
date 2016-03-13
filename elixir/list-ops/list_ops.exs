defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(list) do
    reverse_acc(list, [])
  end

  defp reverse_acc([], acc), do: acc
  defp reverse_acc([head | tail], acc) do
    reverse_acc(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map([], func), do: []
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], func), do: []
  def filter([head | tail] = list, func) do
    case func.(head) do
      true -> [head | filter(tail, func)]
      false -> filter(tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, func), do: acc
  def reduce([head | tail], acc, func) do
    reduce(tail, func.(head, acc), func)
  end

  @spec append(list, list) :: list
  def append([], list), do: list
  def append([head | tail], other) do
    [head | append(tail, other)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]) do
    append(head, concat(tail))
  end
end
