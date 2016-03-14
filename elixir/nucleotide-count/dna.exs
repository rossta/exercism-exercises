defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @empty_histogram @nucleotides |>
    Enum.reduce(%{}, fn(nuc, histo) -> Map.put(histo, nuc, 0) end)

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(_, nuc) when not nuc in @nucleotides,
    do: raise ArgumentError
  def count(strand, nuc) when nuc in @nucleotides do
    strand
    |> histogram
    |> Map.get(nuc)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Map
  def histogram(strand), do: histogram(strand, @empty_histogram)
  defp histogram([], dict), do: dict
  defp histogram([nuc|_], _) when not nuc in @nucleotides,
    do: raise ArgumentError
  defp histogram([nuc|tail], dict) do
    histogram(tail, Map.update!(dict, nuc, &(&1 + 1)))
  end
end
