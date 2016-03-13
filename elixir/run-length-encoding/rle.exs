defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(\w)\1*/, string)
    |> Enum.map_join(&collapse_chunk/1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string)
    |> Enum.map_join(&expand_chunk/1)
  end

  defp collapse_chunk([chunk | letter] = match) do
    "#{String.length(chunk)}#{letter}"
  end

  defp expand_chunk([_, count, letter]) do
    {int, _} = Integer.parse(count)
    String.duplicate(letter, int)
  end
end
