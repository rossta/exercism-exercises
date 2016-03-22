defmodule Roman do
  @numerals %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(0), do: ""
  def numerals(number) do
    addend = max_addend(number)
    Map.get(@numerals, addend) <> numerals(number - addend)
  end

  defp max_addend(number) do
    Map.keys(@numerals)
    |> Enum.filter(fn(n) -> number >= n end)
    |> Enum.max
  end
end
