defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]

  def list(flags) when rem(flags, 256) == 0 do
    []
  end 

  def list(flags) do
    allergy_map = %{
      0 => "eggs",
      1 => "peanuts",
      2 => "shellfish",
      3 => "strawberries",
      4 => "tomatoes",
      5 => "chocolate",
      6 => "pollen",
      7 => "cats"
    }

    rem(flags, 256) |>
    Integer.digits(2) |>
    Enum.reverse |>
    Enum.with_index |>
    Enum.map(fn({a,b}) -> if a !== 0 do allergy_map[b] else  end end) |>
    Enum.filter(fn(x) -> x != nil end)
  end

  

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    list(flags) |>
    Enum.reduce(false, fn(x, acc) -> x == item or acc end)
  end
end
