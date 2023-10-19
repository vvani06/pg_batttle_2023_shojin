#!/bin/env ruby

def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)

  index_recorder = Hash.new{ |h, k| h[k] = [] }
  between_counts = []
  a.each_with_index{ |ai, i|
    index_recorder[ai] << i
    if index_recorder[ai].size == 2
      between_counts << index_recorder[ai][1] - index_recorder[ai][0] - 1
    end
  }

  # 間にいる人数の数え上げ
  between_nums = between_counts.tally
  # 以下の数を記録する
  under_nums = 0
  (2 * n - 1).times{|k|
    # 数え上げの中に一致する数があれば加算
    under_nums += between_nums[k] unless between_nums[k].nil?
    puts under_nums
  }
end

main
