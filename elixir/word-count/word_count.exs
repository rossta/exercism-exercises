defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.split(~r/[\s\,\_\!&@\$%\^:]/, trim: true)
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, &Words.count_word/2)
  end

  def count_word(word, map) do
    map
    |> Map.update(word, 1, &(&1 + 1))
  end
end
