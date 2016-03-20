defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a > 0 and b > 0 and c > 0, do: inequality_kind(a, b, c)
  def kind(_, _, _), do: { :error, "all side lengths must be positive" }

  defp inequality_kind(a, b, c) when a + b > c and a + c > b and b + c > a,
    do: valid_kind(a, b, c)
  defp inequality_kind(_, _, _),
    do: { :error, "side lengths violate triangle inequality" }

  defp valid_kind(a, a, a), do: { :ok, :equilateral }
  defp valid_kind(a, b, c) when a == b or b == c or a == c, do: { :ok, :isosceles }
  defp valid_kind(a, b, c), do: { :ok, :scalene }
end
