defmodule Aoc2019Test do
  use ExUnit.Case
  import Aoc2019
  doctest Aoc2019

  test "day3" do

    #assert day31("R2,D3,L3,U3\nD5,R1,U6") == 159
    assert day31("R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83") == 159
    assert day31("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7") == 135
    assert read_day31() == 399
  end
end
