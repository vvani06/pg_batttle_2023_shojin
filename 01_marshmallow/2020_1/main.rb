#!/bin/env ruby

n, x, a, b = gets.split.map(&:to_i)

if n < x
  puts n * a
else
  puts n * b
end
