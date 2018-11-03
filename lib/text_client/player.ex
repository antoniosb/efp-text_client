defmodule TextClient.Player do
  @moduledoc """
  The actual interactions between the game and the player.
  """
  alias TextClient.State

  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You WON 😎!!!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you LOST 😭...")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message(game, "Good guess! 😃")
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message(game, "Whoops, that one isn't in the word... 😕")
  end

  def play(game = %State{tally: %{game_state: :already_used}}) do
    continue_with_message(game, "Ouch! You've already picked this one... 🤔")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> display()
    |> prompt()
    |> make_move()
    |> play()
  end

  defp display(game), do: game
  defp prompt(game), do: game
  defp make_move(game), do: game

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end
end
