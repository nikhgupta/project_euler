#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=1
# ============================================================================
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
# ----------------------------------------------------------------------------
# Published on: Friday, 5th October 2001, 06:00 pm
# Solved by   : 332662 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution1 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # logic:
      # 3,6,9,12,15,18 => m = (20-1)/3  = 6; s  = 3  * m(m+1)/2 = 63
      # 5,10,15        => m = (20-1)/5  = 3; s += 5  * m(m+1)/2 = 93
      # 15             => m = (20-1)/15 = 1; s -= 15 * m(m+1)/2 = 78
      # 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78

      # code:
      sum_of_divisibles_below(n, 3) + sum_of_divisibles_below(n, 5) - sum_of_divisibles_below(n, 15)
    end

    def sum_of_divisibles_below(n, d)
      k = (n-1)/d
      (d * k * (k+1))/2
    end
  end
end
