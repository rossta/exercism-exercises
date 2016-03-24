defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    number
    |> factors(3, "")
  end

  defp factors(number, 3, string) when rem(number, 3) == 0 do
    factors(number, 5, string <> "Pling")
  end
  defp factors(number, 3, string) do
    factors(number, 5, string)
  end
  defp factors(number, 5, string) when rem(number, 5) == 0 do
    factors(number, 7, string <> "Plang")
  end
  defp factors(number, 5, string) do
    factors(number, 7, string)
  end
  defp factors(number, 7, string) when rem(number, 7) == 0 do
    string <> "Plong"
  end
  defp factors(number, _, string) when bit_size(string) > 0, do: string
  defp factors(number, _, _), do: to_string(number)
end
