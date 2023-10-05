#!/bin/env ruby

n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

between_counts = Array.new(n + 1, 0)
a.each_with_index{ |ai, i|
  last = a.rindex(ai)
  next if i == last
  between_num = a.rindex(ai) - i - 1
  between_counts[ai] = between_num
}

# 先頭のNo0は数える際に邪魔なため削除
between_counts.shift

# puts between_counts
(2 * n - 1).times{|k|
  puts between_counts.count{|i| i <= k }
}
