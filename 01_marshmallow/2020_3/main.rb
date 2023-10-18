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

  (2 * n - 1).times{|k|
    puts between_counts.count{|i| i <= k }
  }
end

main

# lower_bound, upper_boundはいらんか
# ref. https://atcoder.jp/contests/abc321/submissions/45823708
# class Range
#   def upper_bound; ac, wa = self.begin, self.end_open; while wa - ac > 1; if yield((wj = (ac + wa) / 2)); ac = wj else wa = wj end; end; yield(ac) ? ac : nil end
#   def lower_bound; ac, wa = self.end_open, self.begin; while ac - wa > 1; if yield((wj = (ac + wa) / 2)); ac = wj else wa = wj end; end; yield(ac) ? ac : nil end
# end
