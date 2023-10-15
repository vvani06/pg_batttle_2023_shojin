#!/bin/env ruby

x = gets.chomp.split('').map(&:to_i)

ans = x
if x.include?(0)
  idx = x.index(0)
  ans = x[0..idx - 1] + x[idx..-1].map { |i| i = 1 }
end

puts ans.join
