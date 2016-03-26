defmodule Atbash do
  @alphabet ?a..?z |> Enum.into([])

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.replace(~r/[^a-zA-Z0-9]+/, "")
    |> String.to_char_list
    |> Enum.map(&encode_char/1)
    |> in_chunks([], [])
    |> Enum.map_join(" ", &to_string/1)
  end

  defp encode_char(n) do
    encode_alpha n, @alphabet |> Enum.find_index(&(&1 == n))
  end

  defp encode_alpha(n, index) when is_nil(index), do: n
  defp encode_alpha(_, index), do: @alphabet |> Enum.reverse |> Enum.at(index)

  defp in_chunks([], chunk, chunks), do: Enum.reverse([Enum.reverse(chunk) | chunks])
  defp in_chunks([head | tail], chunk, chunks) when length(chunk) == 5 do
    in_chunks(tail, [head], [Enum.reverse(chunk) | chunks])
  end
  defp in_chunks([head | tail], chunk, chunks) do
    in_chunks(tail, [head | chunk], chunks)
  end
end
