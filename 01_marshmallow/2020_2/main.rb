#!/bin/env ruby

n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

ave_a = a.sum.to_f / n
ave_b = b.sum.to_f / n

case ave_a <=> ave_b
when 1
  puts 'A'
when -1
  puts 'B'
when 0
  puts 'same'
end
