defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    input =~ ~r/\p{L}/ && String.upcase(input) == input
  end

  defp silence?(input) do
    input =~ ~r/^\s*$/
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
