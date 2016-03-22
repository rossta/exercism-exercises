defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new(nil | list) :: Queens.t()
  def new do
    new(black: {7, 3}, white: {0, 3})
  end
  def new(white: {row, col}, black: {row, col}), do: raise ArgumentError
  def new([_|_] = positions) do
    Map.merge(%Queens{}, Enum.into(positions, %{}))
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    List.duplicate("_", 64)
    |> List.replace_at(linear_position(queens.white), "W")
    |> List.replace_at(linear_position(queens.black), "B")
    |> Enum.chunk(8)
    |> Enum.map_join("\n", &(Enum.join(&1, " ")))
  end

  defp linear_position({row, column}), do: (row * 8) + column

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: {row, _}, black: {row, _}}), do: true
  def can_attack?(%Queens{white: {_, col}, black: {_, col}}), do: true
  def can_attack?(%Queens{white: {row1, col1}, black: {row2, col2}}),
    do: abs(row1 - row2) == abs(col1 - col2)
end
