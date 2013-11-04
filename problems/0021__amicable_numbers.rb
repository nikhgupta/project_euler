#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=21
# ============================================================================
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.
# ----------------------------------------------------------------------------
# Published on: Friday, 5th July 2002, 06:00 pm
# Solved by   : 64834 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution21 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 10000

      # solved:
      self.mark_as_solved

      # code:
      sum = {}; pairs = []
      (1..n).each do |k|
        ks = proper_divisors_sum(k)
        sum[k] = ks
        pairs.push([k,ks]) if k != ks && sum[ks] && sum[ks] == k
      end

      pairs.flatten.inject(&:+)
    end

    def proper_divisors_sum(k)
      divisors = []
      sqrt = Math.sqrt(k).floor
      (1..sqrt).each do |i|
        divisors << [i, k/i] if k % i == 0
      end
      divisors.flatten.uniq.inject(&:+) - k
    end
  end
end
