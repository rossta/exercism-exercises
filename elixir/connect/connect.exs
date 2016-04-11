defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t]) :: :none | :black | :white
  def result_for(string_board) do
    board = string_board |> Enum.map(&String.graphemes/1)
    cond do
      winner?((board |> transpose), "O") -> :white
      winner?(board, "X") -> :black
      true -> :none
    end
  end

  defp winner?(board, piece) do
    board
    |> Enum.with_index
    |> Enum.any?(fn {[first|_], row} ->
      first == piece && winner?(board, piece, [{row, 0}])
    end)
  end

  defp winner?(board, piece, [{_, col} | _]) when col == length(hd board) - 1,
    do: true
  defp winner?(board, piece, [{row, col} | _] = path) do
    neighbors(row, col, board)
    |> Enum.filter(&(!&1 in path))
    |> Enum.filter(&(get_piece(board, &1) == piece))
    |> Enum.any?(&winner?(board, piece, [&1 | path]))
  end

  defp get_piece(board, {row, col}) do
    board |> Enum.at(row) |> Enum.at(col)
  end

  defp transpose(board) do
    board
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  defp neighbors(row, col, board) do
    for a <- (row-1)..(row+1),
        b <- (col-1)..(col+1),
        a >= 0 && b >= 0,
        a < length(board) && b < length(hd(board)),
        !(a == row && b == col),
        do: {a, b}
  end
end
