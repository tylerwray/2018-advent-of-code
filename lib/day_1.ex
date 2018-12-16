defmodule AdventOfCode.Day1 do
  def sum do
    get_frequency_changes()
    |> Enum.reduce(0, &combine/2)
  end

  def first_duplicate do
    changes = get_frequency_changes()
    hunt_duplicate(:cont, changes, 0, %{}, 0)
  end

  defp combine(operation, sum) do
    operator = String.at(operation, 0)

    number =
      operation
      |> String.slice(1..-1)
      |> String.to_integer()

    case operator do
      "+" -> sum + number
      "-" -> sum - number
    end
  end

  defp get_frequency_changes do
    "lib/day_1.txt"
    |> Path.absname()
    |> File.read!()
    |> String.split("\n")
  end

  defp hunt_duplicate(:halt, frequency) do
    frequency
  end

  defp hunt_duplicate(:cont, changes, cursor, map, sum) do
    currentCursor =
      case length(changes) == cursor do
        true -> 0
        false -> cursor
      end

    operation = Enum.at(changes, currentCursor)
    frequency = combine(operation, sum)

    exists = Map.has_key?(map, frequency)

    case exists do
      false ->
        hunt_duplicate(:cont, changes, currentCursor + 1, Map.put(map, frequency, 1), frequency)

      true ->
        hunt_duplicate(:halt, frequency)
    end
  end
end
