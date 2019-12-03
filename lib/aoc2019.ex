defmodule Aoc2019 do
  @moduledoc """
  Documentation for Aoc2019.
  """

  @doc """
  Hello world.

  ## Examples
  """
  def read_day31 do
    File.read!("data/03.txt")
    |> day31
  end
  def day31(string) do
    starting_point = {0, 0}
    [l1 | [l2]] = string
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ","))
    #map over both lists
    |> Enum.map(&process_one_list(&1))
    |> Enum.map(&Enum.into(&1, MapSet.new()))
    MapSet.intersection(l1, l2)
    |> MapSet.to_list()
    |> Enum.sort_by(fn {x,y} -> abs(x)+abs(y)   end)
    |> Enum.fetch!(1)
    |> Tuple.to_list
    |> Enum.sum
  end
  def process_one_list(list) do
    list
    |> Enum.reduce([{0,0}], &gen_line(&1, &2))

    #  Enum.reduce(nested_list, [], &gen_line(&1, &2, acc))
    #|> Enum.reduce(0, &mass_rec(&1) + &2)
  end

  def gen_end(start, "+", len), do: start + String.to_integer(len)
  def gen_end(start, "-", len), do: start - String.to_integer(len)
  def gen_line("R" <> length, [{x,y}| _] = acc) do
    head = gen_end(x, "+", length)..x+1
    |> Enum.map(&{&1, y})
    head ++ acc
  end
  def gen_line("L" <> length,[{x,y}|_] = acc) do
    head = gen_end(x, "-", length)..x-1
    |> Enum.map(&{&1, y})
    head ++ acc
  end
  def gen_line("U" <> length,[{x,y}|_] = acc) do
    head = gen_end(y, "+", length)..y+1
    |> Enum.map(&{x, &1})
    head ++ acc
  end
  def gen_line("D" <> length,[{x,y}|_] = acc) do
    head = gen_end(y, "-", length)..y-1
    |> Enum.map(&{x, &1})
    head ++ acc
  end
end
