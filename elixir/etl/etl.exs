defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Map) :: map()
  def transform(input) do
    input
    |> Enum.map(&transform_pair/1)
    |> Enum.reduce(%{}, &Enum.into/2)
  end

  defp transform_pair({key, vals}) do
    vals
    |> Enum.map(fn(val) -> { String.downcase(val), key } end)
  end
end
