defmodule AdventOfCode.Day1 do
  defp combine(x, acc) do
    operator = String.at(x, 0)
    number = x
      |> String.slice(1..-1)
      |> String.to_integer

    case operator do
      "+" -> acc + number
      "-" -> acc - number
    end
  end

  def sum do
    "lib/day_1.txt"
    |> Path.absname
    |> File.read!
    |> String.split("\n")
    |> Enum.reduce(0, &combine/2)
  end
end
