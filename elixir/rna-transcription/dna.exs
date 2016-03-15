defmodule DNA do
  @nucleotides %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &to_rna_nucleotide/1)
  end

  def to_rna_nucleotide(dna_nucleotide) do
    Map.get(@nucleotides, dna_nucleotide)
  end
end
