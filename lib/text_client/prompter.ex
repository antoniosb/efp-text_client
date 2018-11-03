defmodule TextClient.Prompter do
  @moduledoc """
  Reads the player inputs
  """

  alias TextClient.State

  def accept_move(game = %State{}) do
    IO.gets("Your guess 🙃: ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _game) do
    IO.puts("Game ended 😵: #{reason}")
  end

  defp check_input(:eof, _game) do
    IO.puts("Looks like you gave up... 😩")
  end

  defp check_input(data, game = %State{}) do
    input =
      data
      |> String.trim()

    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :guess, input)

      true ->
        IO.puts("... please enter a single lowercase letter 🙄")
        accept_move(game)
    end
  end
end
