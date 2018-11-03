defmodule TextClient.Interact do
  @moduledoc """
  Implementation of text-based client interface for the Hangman game.
  """

  alias TextClient.{Player, State}

  def start do
    Hangman.new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end
end
