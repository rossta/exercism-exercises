defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    count = number-1
    """
    #{bottles(count) |> String.capitalize} of beer on the wall, #{bottles(count)} of beer.
    #{bottle_action(count)}, #{bottles(count-1)} of beer on the wall.
    """
  end

  defp bottles(1), do: "1 bottle"
  defp bottles(count), do: "#{remaining count} bottles"

  defp bottle_action(0), do: "Go to the store and buy some more"
  defp bottle_action(1), do: "Take it down and pass it around"
  defp bottle_action(n), do: "Take one down and pass it around"

  defp remaining(0), do: "no more"
  defp remaining(n) when n < 0, do: 99
  defp remaining(n), do: n

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics, do: lyrics(100..1)
  def lyrics(range) do
    range
    |> Enum.map(fn n -> verse(n) end)
    |> Enum.join("\n")
  end
end
