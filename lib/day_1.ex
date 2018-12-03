defmodule AdventOfCode.Day1 do
  defp combine(x, acc) do
    operator = String.at(x, 0)

    number =
      x
      |> String.slice(1..-1)
      |> String.to_integer()

    case operator do
      "+" -> acc + number
      "-" -> acc - number
    end
  end

  defp get_frequency_changes do
    "lib/day_1.txt"
    |> Path.absname()
    |> File.read!()
    |> String.split("\n")
  end

  def sum do
    get_frequency_changes()
    |> Enum.reduce(0, &combine/2)
  end

  defp hunt_duplicate(x, {map, sum}) do
    frequency = combine(x, sum)

    exists = Map.has_key?(map, frequency)

    case exists do
      false -> {:cont, {Map.put(map, frequency, 1), frequency}}
      true -> {:halt, {map, frequency}}
    end
  end

  def first_duplicate do
    # TODO: Figure out how to continually go through the list of frequency changes
    # Recursion?
    get_frequency_changes()
    |> Enum.reduce_while({%{}, 0}, &hunt_duplicate/2)
  end
end
