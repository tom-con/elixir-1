defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.upcase(Enum.join(Regex.scan(~r/\b[a-z]|[A-Z]/, string)))
  end

end
