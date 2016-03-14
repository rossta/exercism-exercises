defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn(word) -> anagram?(base, word) end)
  end

  defp anagram?(base, word) do
    a = normalized(base)
    b = normalized(word)
    a != b and Enum.sort(a) == Enum.sort(b)
  end

  defp normalized(word) do
    word
    |> String.downcase
    |> String.to_char_list
  end
end
