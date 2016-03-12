require IEx
defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.split(sentence, ~r/[\s\,\_\!&@\$%\^:]/, trim: true)
    |> (Enum.reduce %{}, &Words.count_word/2)
  end

  def count_word(word, map) do
    Map.update(map, String.downcase(word), 1, &(&1 + 1))
  end
end
