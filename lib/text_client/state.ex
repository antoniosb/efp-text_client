defmodule TextClient.State do
  @moduledoc """
  The state of structure of the game.
  """
  defstruct game_service: nil,
            tally: nil,
            guessed: ""
end
