defmodule Aoc201905 do
  @moduledoc """
  """

  @doc """
  Hello world.

  ## Examples
  """
  
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

  @doc ~S"""
  ## Examples

    iex> Aoc201905.day5()
    10
  """
  def day5() do
    list = File.read!("data/05.txt")
            |> string_to_list()
    len = length(list)
    res = list_to_map(list)
    |> datastructure()
    |> day5_process()
    |> IO.inspect
  end
  @doc ~S"""
  creates a data structure

  ## Examples

    #iex> Aoc201905.day5_process(%{pointer: 0, data: %{0 => 1002, 1 => 4, 2 => 3, 3 => 4, 4 => 33}})
    #10
  """
  def day5_process(program = %{move: current_move}) do
    next_pointer = current_move
                   |>tuple_size
                   |>Kernel.+( program[:pointer] - 1)
    program[:data]
    |> mutate(current_move, program[:pointer])
    |> Map.replace!(:pointer, next_pointer)
    |> Map.drop(:move)
    |> IO.inspect
  end
  def day5_process(%{pointer: pointer, data: data} = program) do
    current_move = data[pointer]
    |> Integer.to_charlist()
    |> move() 
    program
    |> Map.put(:move, current_move)
    |> day5_process()
  end
 
  def mutate(data, {instr, first}= run, pointer) do
    Map.replace!(data, value(data, pointer+1, first), value(data, pointer + 1, first)) 
  end
  def mutate(data, {instr, first, second, third}= run, pointer) do
    Map.replace!(data, value(data, pointer+3, third), calculate(data, instr, pointer, first, second)) 
  end
  def value(x, y, :immediate), do: x[y]
  def value(x, y, :positional), do: x[x[y]]

  def calculate(data, :add, pointer, im_pos1, im_pos2) do
    value(data, pointer+1, im_pos1) + value(data, pointer+2, im_pos2)
  end

  def calculate(data, :mul, pointer, im_pos1, im_pos2) do
    value(data, pointer+1, im_pos1) * value(data, pointer+2, im_pos2)
  end
  @doc ~S"""
  creates a data structure

  ## Examples

    iex> Aoc201905.datastructure(%{})
    %{pointer: 0, data: %{}}
  """
  def datastructure(map) do
    %{
      :pointer => 0,
      :data => map
    }
  end

  @doc ~S"""
  creates a data structure

  ## Examples

    iex> Aoc201905.move('99')
    :end
    iex> Aoc201905.move('1')
    {:add, :positional, :positional, :immediate}
    iex> Aoc201905.move('01')
    {:add, :positional, :positional, :immediate}
    iex> Aoc201905.move('102')
    {:mul, :immediate, :positional, :immediate}
    iex> Aoc201905.move('1001')
    {:add, :positional, :immediate, :immediate}
  """
def move('99'), do: :end
def move([first | [48, instr]]), do: {instruction(instr), position(first), :positional, :immediate}
def move([first, instr]), do: {instruction(instr), position(first), :positional, :immediate}
def move([third, second, first, 48, instr]), do: {instruction(instr), position(first), position(second), position(third)}
def move([second, first, 48,  instr]), do: {instruction(instr), position(first), position(second), :immediate}
def move([48, instr]), do: {instruction(instr), :positional, :positional, :immediate}
def move([50, instr]), do: {instruction(instr), :immediate}
def move([51, instr]), do: {instruction(instr), :immediate}
def move(instr), do: {instruction(instr), :positional, :positional, :immediate}

def instruction(49), do: :add
def instruction(50), do: :mul
def instruction(51), do: :save
def instruction(52), do: :load
def instruction([ x ]), do: instruction(x)
def instruction([57, 57]), do: :end
def position(48), do: :positional
def position(49), do: :immediate
def position(x), do: IO.inspect(x)

def instruction(x), do: IO.inspect(x)

end
