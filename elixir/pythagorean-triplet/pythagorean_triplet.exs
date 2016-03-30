defmodule Triplet do

  @doc """
  Calculates sum of a given triplet of integers.
  """
  @spec sum([non_neg_integer]) :: non_neg_integer
  def sum(triplet) do
    Enum.reduce(triplet, fn (n, sum) -> n + sum end)
  end

  @doc """
  Calculates product of a given triplet of integers.
  """
  @spec product([non_neg_integer]) :: non_neg_integer
  def product(triplet) do
    Enum.reduce(triplet, fn (n, sum) -> n * sum end)
  end

  @doc """
  Determines if a given triplet is pythagorean. That is, do the squares of a and b add up to the square of c?
  """
  @spec pythagorean?([non_neg_integer]) :: boolean
  def pythagorean?([a, b, c]) do
    :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
  end

  @doc """
  Generates a list of pythagorean triplets from a given min (or 1 if no min) to a given max.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(max), do: generate(1, max)
  def generate(min, max) do
    Stream.iterate(min, &(&1+1))
    |> Stream.flat_map(&({&1, &1 + 1, &1 + 1}))
  end

  @doc """
  Generates a list of pythagorean triplets from a given min to a given max, whose values add up to a given sum.
  """
  @spec generate(non_neg_integer, non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max, sum) do

  end
end
