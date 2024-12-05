require 'pry'
require 'set'

class Solution

  INPUT = IO.readlines('./input.txt', chomp:true)
  SAMPLE = IO.readlines('./sample.txt', chomp:true)
  SAMPLE2 = IO.readlines('./sample2.txt', chomp:true)

  def part1(input)
    vertical, down, up = collect_directions(input)
    total = 0
    total += count_xmas(input)
    total += count_xmas(vertical)
    total += count_xmas(up)
    total += count_xmas(down)
    return total
  end

  def count_xmas(arr)
    arr.sum do |str|
      str.scan(/XMAS/).count + str.scan(/SAMX/).count
    end
  end

  def collect_directions(input)
    vertical = Array.new(input[0].length) {""}
    diag_down = Array.new(input[0].length + input.length) {""}
    diag_up = Array.new(input[0].length + input.length) {""}

    input.each_with_index do |line, y|
      line.chars.each_with_index do |character, x|
        vertical[x].concat(character)
        diag_up[y + x].concat(character)
        diag_down[x - y].concat(character)
      end
    end
    return [vertical, diag_up, diag_down]
  end

  def part2(input)
    total = 0
    get_xs(input) {|x| total += 1 if check_x(x)}
    return total
  end

  def check_x(x_arr)
    a, b, c, d, e = x_arr
    if c == "A"
      (((a == "M" && e == "S") || (a == "S" && e == "M")) &&
          ((a == b && d == e) || (a == d && b == e)))
    end
   end

  def get_xs(twodarr)
    twodarr.map! {|x| x.chars}
    twodarr[1..-2].each_with_index do |line, y|
      line[1..-2].each_with_index do |center, x|
        a = twodarr[x][y]
        b = twodarr[x + 2][y]
        c = twodarr[x + 1][y + 1]
        d = twodarr[x][y + 2]
        e = twodarr[x + 2][y + 2]
        yield [a,b,c,d,e]
      end
    end
  end

  def sample
    puts "Part 1:  #{part1(SAMPLE)}"
    puts "Correct: 9"
    puts "Part 2:  #{part2(SAMPLE)}"
    puts "Correct: 9"
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
