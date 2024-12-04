require 'pry'

class Solution

  INPUT = IO.read('./input.txt')
  SAMPLE = IO.read('./sample.txt')

  def part1(input)
    input.scan(/mul\((?<x>\d*),(?<y>\d*)\)/).sum {|x, y| x.to_i * y.to_i }
  end

  def part2(input)
    instructions = input.scan(/(mul\(\d*,\d*\))|(do(?:n't)?\(\))/)
    read = true
    total = 0
    instructions.each do |imul, ido|
      if imul && read
        m = imul.match(/mul\((\d*),(\d*)\)/)
        total += m[1].to_i * m[2].to_i
      elsif ido
        if ido == "don't()"
          read = false
        elsif ido == "do()"
          read = true
        end
      end
    end
    total
  end

  def sample
    puts "Part 1:  #{part1(SAMPLE)}"
    puts "Correct: 161"
    puts "Part 2:  #{part2(SAMPLE)}"
    puts "Correct: 48"
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
