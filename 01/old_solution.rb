# frozen_string_literal: true
module Year2024
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def split_input
      left = []
      right = []
      data.map do |x|
        nums = x.split
        left << nums.first.to_i
        right << nums.last.to_i
      end
      return [left, right]
    end

    def part_1
      left = []
      right = []
      arr_split = data.map do |x|
        nums = x.split
        left << nums.first.to_i
        right << nums.last.to_i
      end
      left.sort!
      right.sort!
      distances = left.zip(right).
        map{ |x| (x.first.to_i - x.last.to_i).abs }
      distances.sum
    end

    def part_2
      left = []
      right = []
      arr_split = data.map do |x|
        nums = x.split
        left << nums.first.to_i
        right << nums.last.to_i
      end

    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
