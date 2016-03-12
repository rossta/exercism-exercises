defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    Regex.match?(~r/[[:upper:]]/m, input) && Regex.match?(~r/^[[:upper:]0-9\W]+!?$/m, input)
  end

  defp silence?(input) do
    Regex.match?(~r/^\s*$/m, input)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
