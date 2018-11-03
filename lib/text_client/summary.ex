defmodule TextClient.Summary do
  @moduledoc """
  Displays information to the player
  """
  alias TextClient.State

  def display(game = %State{tally: tally}) do
    IO.puts([
      "\n",
      "Word so far:\t #{tally.letters |> Enum.join(" ")} 🤫",
      "\n",
      "Guesses left:\t #{tally.turns_left} 🤨",
      "\n"
    ])

    game
  end
end
