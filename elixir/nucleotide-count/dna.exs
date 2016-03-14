defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    assert_valid_strand([nucleotide])
    strand
    |> assert_valid_strand
    |> Enum.filter(fn(char) -> char == nucleotide end)
    |> length
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Map
  def histogram(strand) do
    strand
    |> assert_valid_strand
    |> Enum.reduce(empty_histogram, &count_nucleotide/2)
  end

  defp empty_histogram do
    'ATCG' |>
    Enum.reduce(%{}, fn(nuc, histo) -> Map.put(histo, nuc, 0) end)
  end

  defp count_nucleotide(nucleotide, histogram) do
    Map.update!(histogram, nucleotide, &(&1 + 1))
  end

  defp assert_valid_strand(strand) do
    cond do
      Regex.match?(~r/^[A|T|C|G]*$/, to_string(strand)) -> strand
      true -> raise ArgumentError, message: "invalid argument #{strand}"
    end
  end
end
