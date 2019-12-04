defmodule BasicBench do
  use Benchfella
  import Aoc201904

  bench "day41" do
    day41(245318, 765747)
  end
  bench "day42" do
    day42(245318, 765747)
  end
end
