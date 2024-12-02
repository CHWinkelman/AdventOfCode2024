require 'pry'

class Solution

  INPUT = IO.readlines('./input.txt', chomp:true)
  SAMPLE = IO.readlines('./sample.txt', chomp:true)

  def part1(input)
    nil
  end

  def part2(input)
    nil
  end

  def sample
    puts "Part 1:  #{part1(SAMPLE)}"
    puts "Correct: ???FILLME???"
    puts "Part 2:  #{part2(SAMPLE)}"
    puts "Correct: ???FILLME???"
  end

  def run
    puts "Part 1:", part1(INPUT)
    puts "Part 2:", part2(INPUT)
  end
end

runner = Solution.new
if ARGV.first == "run"
  puts "Final input"
  runner.run
else
  puts "Test input"
  runner.sample
end
