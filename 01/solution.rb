require 'pry'

class Solution

  INPUT = IO.readlines('./input.txt', chomp:true)
  SAMPLE = IO.readlines('./sample.txt', chomp:true)

  def split_input(data)
    left = []
    right = []
    data.map do |x|
      nums = x.split
      left << nums.first.to_i
      right << nums.last.to_i
    end
    return [left, right]
  end

  def part1(input)
    left, right = split_input(input)
    distances = left.sort.zip(right.sort).
      map{ |x, y| (x - y).abs }
    distances.sum
  end

  def part2(input)
    left, right = split_input(input)

    # A very simple but possibly inefficient solution
    # (could be n^2 depending on the internal implementation)
    similar = left.map {|x| x * right.count(x)}

    # A more efficient solution
    # (should be n-ish assuming hash lookups happen in constant time)
    # similar_hash = Hash.new(0)
    # right.each { |x| similar_hash[x] += 1 }
    # similar = left.map { |x| x * similar_hash[x] }

    # binding.pry

    similar.sum
  end

  def sample
    puts "Part 1:  #{part1(SAMPLE)}"
    puts "Correct: 11"
    puts "Part 2:  #{part2(SAMPLE)}"
    puts "Correct: 31"
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
