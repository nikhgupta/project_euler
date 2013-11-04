#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=14
# ============================================================================
# The following iterative sequence is defined for the set of positive integers:
#
# n -> n/2    (n is even)
# n -> 3n + 1 (n is odd )
# Using the rule above and starting with 13, we generate the following
# sequence:
# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.
# ----------------------------------------------------------------------------
# Published on: Friday, 5th April 2002, 06:00 pm
# Solved by   : 96279 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution14 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000000


      # solved:
      self.mark_as_solved

      # solve1(n)    # Time: ~ 12.2 seconds
      solve2(n)    # Time: ~  2.2 seconds
    end

    def solve2(n)
      # code:
      max_collatz = 0; max_steps = 0
      (1..n).each do |k|
        # the next two lines reduce the time taken by 'solve1' by nearly 6 times
        next if k % 2 == 0
        next if k % 3 != 1
        steps = collatz_sequence_count(k)
        if steps > max_steps
          max_steps   = steps
          max_collatz = k
        end
      end
    end

    def solve1(n)
      # code:
      max_collatz = 0; max_steps = 0
      (1..n).each do |k|
        steps = collatz_sequence_count(k)
        if steps > max_steps
          max_steps   = steps
          max_collatz = k
        end
      end

      # answer:
      # 837799 with 525 steps
      max_collatz
    end

    def collatz_sequence_count(k)
      counter = 1
      while true
        return counter if k == 1
        k = k % 2 == 0 ? k/2 : 3 * k + 1
        counter += 1
      end
    end
  end
end
