# https://adventofcode.com/2018/day/2
defmodule AdventOfCode.Day2 do
  def check_sum do
    get_box_ids()
  end

  defp get_box_ids do
    "lib/day_2/box_ids.txt"
    |> Path.absname()
    |> File.read!()
    |> String.split("\n")
  end

  defp count_letters(id) do
  end
end
