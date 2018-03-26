defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    String.replace(plaintext, ~r/[^\w]/, "")
      |> String.downcase
      |> String.graphemes
      |> Enum.map(&reverse_codes/1)
      |> Enum.reduce("", fn (l, acc) -> acc <> l end)
      |> String.replace(~r/(\w{4})(\w)/, "\\g{1}\\g{2} ")
      |> String.trim
  end

  def reverse_codes(letter) do
    cond do
      String.match?(letter, ~r/[a-z]/) ->
        <<x, 0>> = letter <> <<0>>
        c = (122 - (x-97))
        <<c::utf8>>
      true -> 
        letter
      end
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
      |> String.replace(~r/[^\w]/, "")
      |> String.graphemes
      |> Enum.map(&reverse_codes/1)
      |> Enum.reduce("", fn (l, acc) -> acc <> l end)
  end
end
