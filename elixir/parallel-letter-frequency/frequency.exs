defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency(texts, workers) do
    texts
    |> Enum.flat_map(&normalize/1)
    |> group_by(workers)
    |> Enum.map(fn(worker_letters) ->
      Task.async(fn -> count_letters(worker_letters) end)
    end)
    |> Enum.map(&(Task.await(&1, 10_000)))
    |> merge_counts
  end

  defp group_by(letters, workers) do
    chunks = chunk_size(length(letters), workers)
    letters |> Enum.chunk(chunks, chunks, [])
  end

  defp chunk_size(0, workers), do: 1
  defp chunk_size(units, workers) when units <= workers, do: units
  defp chunk_size(units, workers), do: div(units, workers)

  defp count_letters(letters) do
    letters
    |> Enum.uniq
    |> Enum.reduce(%{}, fn(letter, counts) ->
        count_letter(letter, letters, counts) end)
  end

  defp count_letter(letter, letters, counts) do
    count = letters |> Enum.filter(&(&1 == letter)) |> length
    Map.update(counts, letter, count, &(&1 + count))
  end

  defp normalize(text) do
    text
    |> String.downcase
    |> String.replace(~r/[\s\d,\.\;\!"'-_]+/, "")
    |> String.split("", trim: true)
  end

  defp merge_counts(counts) do
    counts
    |> Enum.reduce(%{}, fn(counts, acc) ->
      Map.merge(acc, counts, fn(_k, v1, v2) -> v1 + v2 end) end)
  end
end
