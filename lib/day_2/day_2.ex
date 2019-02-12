# https://adventofcode.com/2018/day/2
defmodule AdventOfCode.Day2 do
  def check_sum do
    get_box_ids()
    |> Enum.map(&to_counts_list/1)
    |> Enum.reduce(%{}, fn x, acc ->
      x
      |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
      |> Map.delete(1)
      |> Map.merge(acc, fn _k, v1, v2 -> v1 + v2 end)
    end)
    |> Map.values()
    |> Enum.reduce(1, &(&1 * &2))
  end

  defp get_box_ids do
    "lib/day_2/box_ids.txt"
    |> Path.absname()
    |> File.read!()
    |> String.split("\n")
  end

  defp to_counts_list(id) do
    id
    |> String.graphemes()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Map.values()
    |> Enum.sort()
    |> Enum.dedup()
  end
end
