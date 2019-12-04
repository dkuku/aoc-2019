defmodule Aoc201904Test do
  use ExUnit.Case
  import Aoc201904
  doctest Aoc2019

  test "day4" do
    assert is_increasing(111111) == true
    assert is_increasing(223450) == false
    assert is_increasing(123789) == true
    assert is_increasing(123389) == true
    assert is_increasing(123289) == false
    assert has_double(123789) == false
    assert has_double(123389) == true
    assert has_doubleV2(123389) == true
    assert has_doubleV2(122388) == true
    assert has_doubleV2(123339) == false
    assert has_doubleV2(223339) == true
    assert day41(245318, 765747) == 1079
    assert day42(245318, 765747) == 699
    assert day4 == 0
  end
end
