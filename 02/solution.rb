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
    input.count do |line|
      levels = line.split.map {|num| num.to_i }
      get_levels_and_directions(levels)
    end
  end

  def get_levels_and_directions(levels)
    step_differences = levels[0..-2].zip(levels[1..-1]).
      map { |x, y| y - x } # positive: increasing, negative: decreasing
    wrong_change = []
    inc = []
    dec = []
    step_differences.each_with_index do |diff, position|
      direction = d / d.abs
      if direction != 0
        direction == 1 ? inc << position : dec << position
        if diff.abs > 3
          bad_levels << position
        end
      else
        bad_levels << position
      end
    end

    if inc.count > dec.count



      #
      #      -1
      #    3    -1     2     1
      # 1  |  4  |  3  |  5  |  6

      #
      #   -1     2     1     3
      # 5  |  4  |  6  |  7  |  10


    end


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
