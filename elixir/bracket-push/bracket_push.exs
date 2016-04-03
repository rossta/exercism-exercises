defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes
    |> do_check([])
  end

  def do_check([], []), do: true
  def do_check([], _), do: false
  def do_check(["[" | tail], stack), do: do_check(tail, ["[" | stack])
  def do_check(["]" | tail], ["[" | stack]), do: do_check(tail, stack)
  def do_check(["]" | _], _), do: false

  def do_check(["{" | tail], stack), do: do_check(tail, ["{" | stack])
  def do_check(["}" | tail], ["{" | stack]), do: do_check(tail, stack)
  def do_check(["}" | _], _), do: false

  def do_check(["(" | tail], stack), do: do_check(tail, ["(" | stack])
  def do_check([")" | tail], ["(" | stack]), do: do_check(tail, stack)
  def do_check([")" | _], _), do: false

  def do_check([_ | tail], stack), do: do_check(tail, stack)
end
