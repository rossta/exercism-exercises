defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate([]), do: []
  def annotate(board) do
    board
    |> Enum.map(&String.graphemes/1)
    |> Enum.with_index
    |> to_board_map(%{})
    |> annotate_board([])
  end

  defp annotate_board(map, board) do
    map
    |> Map.keys
    |> Enum.reverse
    |> annotate_row(map, board)
  end

  defp annotate_row([], map, board), do: board
  defp annotate_row([row_index | rest], map, board) do
    row = map[row_index]
    |> Map.keys
    |> Enum.reverse
    |> annotate_coords(row_index, map, [])
    |> Enum.join

    annotate_row(rest, map, [row | board])
  end

  defp annotate_coords([], _, map, coords), do: coords
  defp annotate_coords([col_index | rest], row_index, map, coords) do
    coord = get_in(map, [row_index, col_index])
    |> annotate_coord(row_index, col_index, map)
    annotate_coords(rest, row_index, map, [coord | coords])
  end

  defp annotate_coord("*", row, col, map), do: "*"
  defp annotate_coord(_, row, col, map) do
    count_adjacent_mines(row, col, map)
    |> format_count
  end

  defp format_count(0), do: " "
  defp format_count(n), do: to_string(n)

  defp count_adjacent_mines(row, col, map) do
    adjacent_coords(row, col, map)
    |> Enum.reduce(0, fn(coord, count) ->
      cond do
        get_in(map, coord) == "*" -> count + 1
        true -> count
      end
    end)
  end

  defp adjacent_coords(row, col, map) do
    for a <- (row-1)..(row+1),
        b <- (col-1)..(col+1),
        !(a == row && b == col),
        do: [a, b]
  end

  defp to_board_map([], map), do: map
  defp to_board_map([{board_row, row_index} | board], map) do
    row_map = board_row |> Enum.with_index |> to_row_map(%{})
    board |> to_board_map(Map.merge(map, %{row_index => row_map}))
  end

  defp to_row_map([], map), do: map
  defp to_row_map([{char, col_index} | row], map) do
    row |> to_row_map(Map.merge(map, %{col_index => char}))
  end
end
