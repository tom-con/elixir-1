defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn(cand) -> String.downcase(base) !== String.downcase(cand) && prepare_string(base) === prepare_string(cand) end)\
  end

  def prepare_string(str) do
    String.downcase(str) 
      |> String.graphemes 
      |> Enum.sort
  end

end
