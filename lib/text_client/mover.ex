defmodule TextClient.Mover do
  @moduledoc """
  Updates the game state according to the user guesses
  """
  alias TextClient.State

  def make_move(game = %State{}) do
    {new_game, tally} = Hangman.make_guess(game.game_service, game.guess)
    %State{game | game_service: new_game, tally: tally}
  end
end
