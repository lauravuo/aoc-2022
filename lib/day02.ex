defmodule Day02 do
  def getInput do
    url = "https://adventofcode.com/2022/day/2/input"

    response = HTTPoison.get!(url, [{"Cookie", "session=" <> System.get_env("AOC_COOKIE")}])
    content = response.body
    String.trim(content)
  end

  def part1 do
    IO.puts("Day 2 part 1")

    content = getInput()

    rules = %{
      "A X" => 4,
      "A Y" => 8,
      "A Z" => 3,
      "B X" => 1,
      "B Y" => 5,
      "B Z" => 9,
      "C X" => 7,
      "C Y" => 2,
      "C Z" => 6
    }

    total =
      Enum.reduce(String.split(content, ["\n"]), 0, fn item, res ->
        res + rules[item]
      end)

    IO.puts("RESULT 1: " <> to_string(total))
  end

  def part2 do
    IO.puts("Day 2 part 2")

    content = getInput()

    rules = %{
      "A X" => 3,
      "A Y" => 4,
      "A Z" => 8,
      "B X" => 1,
      "B Y" => 5,
      "B Z" => 9,
      "C X" => 2,
      "C Y" => 6,
      "C Z" => 7
    }

    total =
      Enum.reduce(String.split(content, ["\n"]), 0, fn item, res ->
        res + rules[item]
      end)

    IO.puts("RESULT 2: " <> to_string(total))
  end
end
