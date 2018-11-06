defmodule TextClient.Interact do
  @moduledoc """
  Implementation of text-based client interface for the Hangman game.
  """

  @hangman_server :"hangman@Antonios-MacBook-Pro"

  alias TextClient.{Player, State}

  def start do
    new_game()
    |> setup_state()
    |> Player.play(:human)
  end

  def bot do
    Hangman.new_game()
    |> setup_state()
    |> Player.play(:bot)
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)
    :rpc.call(@hangman_server, Hangman, :new_game, [])
  end
end
