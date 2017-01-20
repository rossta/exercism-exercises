defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    codepoints = sentence |> to_codepoints

    codepoints |> length == codepoints |> set_size
  end

  defp to_codepoints(sentence) do
    Regex.replace(~r/[-\s]/, sentence, "")
    |> String.codepoints
    |> List.delete("-")
  end

  defp set_size(codepoints) do
    codepoints
    |> MapSet.new
    |> MapSet.size
  end
end
