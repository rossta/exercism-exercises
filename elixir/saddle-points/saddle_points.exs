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
    Enum.zip(max_matrix(str), min_matrix(str))
    |> Enum.map(&collapse_max_min_row_tuples/1)
    |> Enum.with_index
    |> Enum.filter(&max_min_row?/1)
    |> Enum.map(&min_max_row_to_saddle_point/1)
  end

  defp min_matrix(str) do
    str
    |> columns
    |> Enum.map(&(Enum.map(&1, fn(el) -> el == Enum.min(&1) end)))
    |> transpose
  end

  defp max_matrix(str) do
    str
    |> rows
    |> Enum.map(&(Enum.map(&1, fn(el) -> el == Enum.max(&1) end)))
  end

  def collapse_max_min_row_tuples({maxs, mins}) do
    to_max_min_row(maxs, mins)
  end

  defp to_max_min_row([], []), do: []
  defp to_max_min_row([is_max|maxs], [is_min|mins]) do
    [is_max && is_min] ++ to_max_min_row(maxs, mins)
  end

  defp min_max_row_to_saddle_point({min_max, i}) do
    {i, Enum.find_index(min_max, &(&1 == true))}
  end

  defp max_min_row?({min_max, _}), do: Enum.any?(min_max)
end
