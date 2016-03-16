defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number([?1|tail] = list) when length(list) == 11, do: to_string(tail)
  def number([_|_] = list) when length(list) == 10, do: to_string(list)
  def number([_|_] = list), do: String.duplicate("0", 10)
  def number(raw) do
    Regex.scan(~r/[\d|\w]+/, raw)
    |> Enum.flat_map(&(&1))
    |> Enum.join
    |> to_char_list
    |> number
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> number
    |> format_number
  end

  defp format_number(number) do
    { area, rest } = String.split_at(number, 3)
    { first, last } = String.split_at(rest, 3)
    "(#{area}) #{first}-#{last}"
  end

end
