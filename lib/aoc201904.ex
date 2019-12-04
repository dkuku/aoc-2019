defmodule Aoc201904 do
  @moduledoc """
  Documentation for Aoc2019.
  """

  @doc """
  Hello world.

  ## Examples
  """
  def day41(low, high) do
    low..high
    |> Enum.reduce(0, fn num, acc -> 
      if is_increasing(num) && has_double(num) do
        acc + 1
      else
        acc
      end
    end)
  end

  def day42(low, high) do
    low..high
    |> Enum.reduce(0, fn num, acc -> 
      if is_increasing(num) && has_doubleV2(num) do
        acc + 1
      else
        acc
      end
    end)

  end

  def has_doubleV2(num) when is_integer(num) do
    Integer.to_charlist(num)
    |> has_doubleV2()
  end
  def has_doubleV2([h1 |[h2 | [h3 | [h4 |[h5 |[h6 |[]]]]]]]) do
    h1 == h2 && h2 != h3             ||
    h1 != h2 && h2 == h3 && h3 != h4 ||
    h2 != h3 && h3 == h4 && h4 != h5 ||
    h3 != h4 && h4 == h5 && h5 != h6 ||
    h4 != h5 && h5 == h6
  end

  def has_double(num) when is_integer(num) do
    Integer.to_charlist(num)
    |> has_double()
  end
  def has_double([_ | []]), do: false
  def has_double([head1 |[head2 | []]]), do: head1 == head2
  def has_double([head1 |[head2 | _] = rest]), do: head1 == head2 || has_double(rest) 

  def is_increasing(num) when is_integer(num) do
    Integer.to_charlist(num)
    |> is_increasing()
  end
  def is_increasing([_ | []]), do: true
  def is_increasing([head1 |[head2 | []]]), do: head1 <= head2
  def is_increasing([head1 |[head2 | _] = rest]), do: head1 <= head2 && is_increasing(rest) 
end
