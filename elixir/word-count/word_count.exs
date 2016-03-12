require IEx
defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.downcase(sentence)
    |> String.replace(~r/\_/, " ")
    |> String.replace(~r/[^A-Za-zäöü0-9\-\s]/, "")
    |> String.split(~r/\s+/)
    |> (Enum.reduce %{}, &Words.count_word/2)
  end

  def count_word(word, map) do
    { get, new_map } = Map.get_and_update(map, word,
      fn count -> { count, (count || 0) + 1 } end)
    new_map
  end

  def count_word(word, map) do
    { get, new_map } = Map.get_and_update(map, word,
      fn count -> { count, (count || 0) + 1 } end)
    new_map
  end
end
