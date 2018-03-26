defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    
    cond do
      is_integer(number) and number > 2 ->
        """
        #{number} bottles of beer on the wall, #{number} bottles of beer.
        Take one down and pass it around, #{number - 1} bottles of beer on the wall.
        """
      is_integer(number) and number === 2 ->
        """
        2 bottles of beer on the wall, 2 bottles of beer.
        Take one down and pass it around, 1 bottle of beer on the wall.
        """
      is_integer(number) and number === 1 ->
        """
        1 bottle of beer on the wall, 1 bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
        """
      is_integer(number) and number === 0 ->
        """
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
        """
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    l = Enum.reduce(range, "", fn(x, acc) -> acc <> verse(x) <> "\n" end)
      |> String.trim
    l <> "\n"
  end

  def lyrics do
    l = Enum.reduce(99..0, "", fn(x, acc) -> acc <> verse(x) <> "\n" end)
      |> String.trim
    l <> "\n"
  end
end
