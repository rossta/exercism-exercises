defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/([A-Z]|\b\w)/, string)
    |> Enum.map(&(Enum.take(&1, 1)))
    |> Enum.join
    |> String.upcase
  end
end
