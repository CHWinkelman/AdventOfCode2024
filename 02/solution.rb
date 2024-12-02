require 'pry'

class Solution

  INPUT = IO.readlines('./input.txt', chomp:true)
  SAMPLE = IO.readlines('./sample.txt', chomp:true)

  def part1(input)
    input.count do |line|
      levels = line.split.map {|num| num.to_i }
      safe_levels?(levels)
    end
  end

  def safe_levels?(levels)
    if levels[0] > levels[1]
      same_direction = proc { |x, y| x > y }
    elsif levels[0] < levels[1]
      same_direction = proc { |x, y| x < y }
    else
      return false
    end

    steps = levels[0..-2].zip levels[1..-1]
    steps.all?(same_direction) &&
      steps.all? do |x, y|
        diff = (x - y).abs
        diff <= 3 && diff >= 1
      end
  end

  def part2(input)
    nil
  end

  def sample
    puts "Part 1:  #{part1(SAMPLE)}"
    puts "Correct: 2"
    puts "Part 2:  #{part2(SAMPLE)}"
    puts "Correct: 4"
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
