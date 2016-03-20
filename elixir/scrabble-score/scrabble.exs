defmodule Scrabble do
# 2 points: U ×5, S ×4, Y ×4, R ×3.
# 3 points: Ɔ ×3, D ×2, T ×2.
# 4 points: F ×2, G ×2, W ×2.
# 8 points: J ×2, C ×1, Ɲ ×1.
# 10 points: H ×1, Ŋ ×1, P ×1, Z ×1.
  @scores %{
    ?a => 1, ?b => 3, ?c => 3, ?d => 2,
    ?e => 1, ?f => 4, ?g => 2, ?h => 4,
    ?i => 1, ?j => 8, ?k => 5, ?l => 1,
    ?m => 3, ?n => 1, ?o => 1, ?p => 3,
    ?q => 10, ?r => 1, ?s => 1, ?t => 1,
    ?u => 1, ?v => 4, ?w => 4, ?x => 8,
    ?y => 4, ?z => 10
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    String.replace(word, ~r/\s+/, "")
    |> String.downcase
    |> to_char_list
    |> Enum.reduce(0, fn(c, sum) -> @scores[c] + sum end)
  end
end
