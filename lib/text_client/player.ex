defmodule TextClient.Player do
  @moduledoc """
  The actual interactions between the game and the player.
  """
  alias TextClient.{Mover, Prompter, State, Summary}

  def play(%State{tally: %{game_state: :won}}, _bot) do
    exit_with_message("You WON 😎!!!")
  end

  def play(%State{tally: %{game_state: :lost}}, _bot) do
    exit_with_message("Sorry, you LOST 😭...")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}, bot) do
    continue_with_message(game, "Good guess! 😃", bot)
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}, bot) do
    continue_with_message(game, "Whoops, that one isn't in the word... 😕", bot)
  end

  def play(game = %State{tally: %{game_state: :already_used}}, bot) do
    continue_with_message(game, "Ouch! You've already picked this one... 🤔", bot)
  end

  def play(game, bot) do
    continue(game, bot)
  end

  defp continue(game, player = :bot) do
    game
    |> Summary.display()
    |> Prompter.auto_move()
    |> Mover.make_move()
    |> play(player)
  end

  defp continue(game, player = :human) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play(player)
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end

  defp continue_with_message(game, message, bot) do
    IO.puts(message)
    continue(game, bot)
  end
end
