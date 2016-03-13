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
    string
    |> String.split("", trim: true)
    |> MyEnum.chunk_while(fn a, b -> a == b end)
    |> Enum.reduce("", &collapse_chunk/2)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string)
    |> Enum.map(&expand_chunk/1)
    |> Enum.join
  end

  defp collapse_chunk([], str), do: str
  defp collapse_chunk([letter | _] = chunk, str) do
    str <> to_string(Enum.count(chunk)) <> letter
  end

  defp expand_chunk([chunk, count, letter]) do
    {int, _} = Integer.parse(count)
    String.duplicate(letter, int)
  end
end

require IEx
defmodule MyEnum do
  def chunk_while([], func), do: []
  def chunk_while([ a | tail ] = list, func) do
    [Enum.take_while(list, fn b -> func.(a, b) end) |
     Enum.drop_while(list, fn b -> func.(a, b) end) |> chunk_while(func)]
  end
end
