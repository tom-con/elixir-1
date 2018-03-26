defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    cond do
      String.match?(string, ~r/[^10]/) ->
        0
      true ->
        String.to_integer(string)
          |> Integer.digits
          |> Enum.reverse
          |> Enum.with_index
          |> Enum.map(fn({el,i}) -> round(el * :math.pow(2, i)) end)
          |> Enum.reduce(0, fn(x, acc) -> acc+x end)
    end 
  end
end
