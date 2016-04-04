defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate([]), do: []
  def annotate(board) do
    board
    |> Enum.map(&String.graphemes/1)
    |> to_board_map
    |> annotate_board([])
  end

  defp annotate_board(map, board) do
    map
    |> Map.keys
    |> Enum.reverse
    |> annotate_row(map, board)
  end

  defp annotate_row([], _, board), do: board
  defp annotate_row([row_index | rest], map, board) do
    row = map[row_index]
    |> Map.keys
    |> Enum.reverse
    |> annotate_coords(row_index, map, [])
    |> Enum.join

    annotate_row(rest, map, [row | board])
  end

  defp annotate_coords([], _, _, coords), do: coords
  defp annotate_coords([col_index | rest], row_index, map, coords) do
    coord = get_in(map, [row_index, col_index])
    |> annotate_coord(row_index, col_index, map)
    annotate_coords(rest, row_index, map, [coord | coords])
  end

  defp annotate_coord("*", _, _, _), do: "*"
  defp annotate_coord(_, row, col, map) do
    count_adjacent_mines(row, col, map) |> format_count
  end

  defp format_count(0), do: " "
  defp format_count(n), do: to_string(n)

  defp count_adjacent_mines(row, col, map) do
    adjacent_coords(row, col)
    |> Enum.filter(fn(coord) -> get_in(map, coord) == "*" end)
    |> length
  end

  defp adjacent_coords(row, col) do
    for a <- (row-1)..(row+1),
        b <- (col-1)..(col+1),
        !(a == row && b == col),
        do: [a, b]
  end

  defp to_board_map(board) do
    board
    |> Enum.with_index
    |> Enum.reduce(%{}, fn({board_row, row_index}, row_map) ->
      cols = board_row
      |> Enum.with_index
      |> Enum.reduce(%{}, fn({char, col_index}, col_map) ->
        Map.put(col_map, col_index, char)
      end)
      Map.put(row_map, row_index, cols)
    end)
  end
end
