defmodule Day03 do
  def getInput do
    url = "https://adventofcode.com/2022/day/3/input"

    response = HTTPoison.get!(url, [{"Cookie", "session=" <> System.get_env("AOC_COOKIE")}])
    content = response.body
    String.trim(content)
  end

  def part1 do
    IO.puts("Day 3 part 1")

    rows = Enum.map(String.split(getInput(), ["\n"]), fn x -> to_charlist(x) end)

    sum =
      Enum.reduce(rows, 0, fn item, res ->
        halfListCount = round(length(item) / 2)
        head = Enum.slice(item, 0, halfListCount)
        tail = Enum.slice(item, halfListCount, halfListCount)

        common =
          Enum.reduce(head, [], fn x, res ->
            if Enum.member?(tail, x) && !Enum.member?(res, x), do: [x | res], else: res
          end)

        value = Enum.at(common, 0)
        # A = 65
        # a = 97
        mappedValue = if value < 97, do: value - 38, else: value - 96
        res + mappedValue
      end)

    IO.puts("Result 1: " <> to_string(sum))
  end

  def part2 do
    IO.puts("Day 3 part 2")

    rows = Enum.map(String.split(getInput(), ["\n"]), fn x -> to_charlist(x) end)

    IO.puts("Rows length: " <> to_string(length(rows)))

    [_temp, common] =
      Enum.reduce(rows, [[], []], fn item, [temp, res] ->
        val = if length(temp) < 2, do: [[item | temp], res], else: calcCommon([item | temp], res)
        val
      end)

    IO.puts("Common length: " <> to_string(length(common)))

    sum =
      Enum.reduce(common, 0, fn item, res ->
        value =
          case item do
            x when x < 97 -> x - 38
            x when x >= 97 -> x - 96
          end

        res + value
      end)

    IO.puts("Result 2: " <> to_string(sum))
  end

  def calcCommon(x, res) do
    [list1, list2, list3] = x

    common =
      Enum.reduce(list1, [], fn y, resTemp ->
        if Enum.member?(list2, y) && Enum.member?(list3, y) &&
             !Enum.member?(resTemp, y),
           do: [y | resTemp],
           else: resTemp
      end)

    [[], [Enum.at(common, 0) | res]]
  end
end
