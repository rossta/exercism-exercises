defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t]) :: :none | :black | :white
  def result_for(board) do
    graphemes = board |> Enum.map(&String.graphemes/1)
    cond do
      winner?(graphemes, "O") -> :white
      winner?((graphemes |> transpose), "X") -> :black
      true -> :none
    end
  end

  defp winner?(graphemes, piece) do
    map = graphemes |> to_board_map

    [first | _] = graphemes

    first
    |> Enum.with_index
    |> Enum.map(fn {val, col} -> {val, 0, col} end)
    |> Enum.filter(fn {val, _, _} -> val == piece end)
    |> Enum.any?(fn {val, row, col} ->
      complete_path_for?({val, row, col},
        map, piece, (length(graphemes)-1), [[row, col]])
    end)
  end

  defp complete_path_for?(_location,
    _map, _piece, finish_row, [[finish_row, _]|_]), do: true

  defp complete_path_for?({ _val, row, col }, map, piece, finish, path) do
    neighbors(row, col, map, path)
    |> Enum.filter(fn {val, _, _} -> val == piece end)
    |> Enum.any?(fn {val, row, col} ->
      complete_path_for?({val, row, col}, map, piece, finish, [[row, col] | path])
    end)
  end

  defp transpose(board) do
    board
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
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

  defp neighbors(row, col, map, path) do
    candidates = for a <- (row-1)..(row+1),
          b <- (col-1)..(col+1),
          !(a == row && b == col), do: [a, b]

    candidates
    |> Enum.filter(fn(coord) -> !Enum.member?(path, coord) end)
    |> Enum.map(fn(coord) -> [get_in(map, coord) | coord] end)
    |> Enum.map(&List.to_tuple/1)
  end
end
