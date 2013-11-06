#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=28
# ============================================================================
# Starting with the number 1 and moving to the right in a clockwise direction
# a 5 by 5 spiral is formed as follows:
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?
# ----------------------------------------------------------------------------
# Published on: Friday, 11th October 2002, 06:00 pm
# Solved by   : 52138 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution28 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1001

      # solved:
      self.mark_as_solved

      # code:
      sum = 1; k = 3; last = 1
      while k <= n
        sum += (last + k ** 2)/2 * 5 - last
        last = k ** 2
        k += 2
      end

      # answer
      sum
    end
  end
end
