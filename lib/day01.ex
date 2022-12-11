defmodule Day01 do
  def getInput do
    url = "https://adventofcode.com/2022/day/1/input"

    response = HTTPoison.get!(url, [{"Cookie", "session=" <> System.get_env("AOC_COOKIE")}])
    content = response.body
    String.trim(content)
  end

  def part1 do
    IO.puts("Day 1 part 1")

    content = getInput()
    elves = String.split(content, ["\n\n"])

    elvCalories =
      Enum.map(
        elves,
        fn x ->
          Enum.reduce(
            Enum.map(
              String.split(String.trim(x), "\n"),
              fn y ->
                {int_val, ""} = Integer.parse(y)
                int_val
              end
            ),
            0,
            fn v, acc -> v + acc end
          )
        end
      )

    [max | rest] = elvCalories

    totalMax =
      Enum.reduce(rest, max, fn i, max ->
        if max < i do
          i
        else
          max
        end
      end)

    IO.puts("RESULT 1: " <> to_string(totalMax))
  end

  def part2 do
    IO.puts("Day 1 part 2")

    content = getInput()
    elves = String.split(content, ["\n\n"])

    elvCalories =
      Enum.map(
        elves,
        fn x ->
          Enum.reduce(
            Enum.map(
              String.split(String.trim(x), "\n"),
              fn y ->
                {int_val, ""} = Integer.parse(y)
                int_val
              end
            ),
            0,
            fn v, acc -> v + acc end
          )
        end
      )

    sorted = Enum.sort(elvCalories, :desc)

    IO.puts(
      "RESULT 2: " <> to_string(Enum.at(sorted, 0) + Enum.at(sorted, 1) + Enum.at(sorted, 2))
    )
  end
end
