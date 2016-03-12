defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/([A-Z]|\b\w)/, string)
    |> Enum.map(fn [first, rest] -> first end)
    |> Enum.join
    |> String.upcase
  end
end
