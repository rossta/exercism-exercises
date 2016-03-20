defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str |> String.split("\n") |> Enum.map(&parse_row/1)
  end

  defp parse_row(str) do
    str |> String.strip |> String.split(" ") |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> transpose
  end

  defp transpose(list) do
    List.zip(list) |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    max_matrix = str |> rows |> Enum.map(&max_row/1)
    min_matrix = str |> columns |> Enum.map(&min_row/1) |> transpose

    Enum.zip(max_matrix, min_matrix)
    |> Enum.map(fn({maxs, mins}) -> max_min_row(maxs, mins) end)
    |> Stream.with_index
    |> Stream.filter(fn({min_max, i}) -> Enum.any?(min_max) end)
    |> Stream.map(fn({min_max, i}) -> {i, Enum.find_index(min_max, &(&1 == true))} end)
    |> Enum.to_list
  end

  defp min_row(row) do
    Enum.map(row, fn(el) -> el == Enum.min(row) end)
  end

  defp max_row(row) do
    Enum.map(row, fn(el) -> el == Enum.max(row) end)
  end

  def max_min_row([], []), do: []
  def max_min_row([is_max|maxs], [is_min|mins]) do
    [is_max && is_min] ++ max_min_row(maxs, mins)
  end
end
