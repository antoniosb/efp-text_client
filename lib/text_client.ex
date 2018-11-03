defmodule TextClient do
  @moduledoc """
  Interface to a client-text based Hangman game.
  """
  defdelegate start(), to: TextClient.Interact
end
