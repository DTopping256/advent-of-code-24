defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """
  @doc """
  To get the answer to Day 1 run:

  `iex> Day1.run()`
  """
  def run do
    {:ok, fileStrContent} = File.read('./data/day1-example.txt')
    linesList = String.split(fileStrContent, "\r\n")
    pairTupleList = for <<codePointA::utf8, 32, 32, 32, codePointB::utf8>> <- linesList, do: {<<codePointA::utf8>>, <<codePointB::utf8>>}
    {:ok, twoLists} = unzipTuplePairList(pairTupleList)
    numbersA = for str <- twoLists[0], do: Integer.parse(str)
    numbersB = for str <- twoLists[1], do: Integer.parse(str)
    integersA = Enum.sort(for {x, _} <- numbersA, do: x)
    integersB = Enum.sort(for {x, _} <- numbersB, do: x)
    {integersA, integersB}
  end

  def unzipTuplePairList(list) do
    unzipTuplePairList(list, %{0 => [], 1 => []})
  end

  def unzipTuplePairList([{a, b} | tail], acc) do
    unzipTuplePairList(tail, %{0 => acc[0] ++ [a], 1 => acc[1] ++ [b]})
  end

  def unzipTuplePairList([], acc) do
    {:ok, acc}
  end
end
