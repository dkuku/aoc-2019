defmodule Aoc2019 do
  @moduledoc """
  Documentation for Aoc2019.
  """

  @doc """
  Hello world.

  ## Examples
  """
  def day1 do
    File.read!("data/01.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    #|> Enum.reduce(0, &mass(&1) + &2) #first solution
    |> Enum.reduce(0, &mass_rec(&1) + &2)
  end

  def mass(num), do: div(num,3) - 2
  def mass_rec(num) when num < 9, do: 0
  def mass_rec(num), do: mass(num) + mass_rec(mass(num))
  
  def string_to_list(string) do
    string
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
  def list_to_map(list) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {k,v}->{v,k} end) 
    |> Map.new
  end

  def day2() do
    Enum.each(0..99, fn x -> 
      Enum.each(0..99, fn y -> day2(x,y) end)
    end)
  end
  def day2(noun, verb) do
    list = File.read!("data/02.txt")
            |> string_to_list()
    len = div(length(list), 4)
    res = list_to_map(list)
    |> Map.put(1, noun)
    |> Map.put(2, verb)
    |> day2_process(len)
    if res == 19690720 do
      IO.inspect(res)
      IO.inspect(noun)
      IO.inspect(verb)
    end
    res
  end
  def day2_process(ma, len) do
    Enum.reduce_while(0..len-1, ma, fn n, map -> 
      case map[n*4] do
        1 -> {:cont, %{map | map[n*4 + 3] => map[map[n*4 + 1]] + map[map[n*4 + 2]]}}
        2 -> {:cont, %{map | map[n*4 + 3] => map[map[n*4 + 1]] * map[map[n*4 + 2]]}}
        99 -> {:halt, map[0]}
        _ -> {:halt, map}
      end
    end)

  end
end
