defmodule TextClient do
  @moduledoc """
  Interface to a client-text based Hangman game.
  """
  defdelegate start(), to: TextClient.Interact
  defdelegate bot(), to: TextClient.Interact
end
