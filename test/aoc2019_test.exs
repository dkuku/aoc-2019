defmodule Aoc2019Test do
  use ExUnit.Case
  import Aoc2019
  doctest Aoc2019

  test "individual mass" do
    assert Aoc2019.mass_rec(12) == 2
    assert Aoc2019.mass_rec(14) == 2
    assert Aoc2019.mass_rec(1969) == 966
    assert Aoc2019.mass_rec(100756) == 50346
    assert Aoc2019.mass(12) == 2
    assert Aoc2019.mass(14) == 2
    assert Aoc2019.mass(1969) == 654
    assert Aoc2019.mass(100756) == 33583
    assert Aoc2019.day1() == 3368364
  end
  test "day 2" do
    assert Aoc2019.string_to_list("1,0,0,0,99")
    |> Aoc2019.list_to_map == %{0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 99}
    assert Aoc2019.string_to_list("1,0,0,0,99")
    |> Aoc2019.list_to_map
    |> Aoc2019.day2_process(5) ==2 
  end
  test "day 2.2" do
    assert Aoc2019.day2() == 19690720
  end
end
