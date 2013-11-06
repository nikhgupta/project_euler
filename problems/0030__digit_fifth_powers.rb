#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=30
# ============================================================================
# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.
# ----------------------------------------------------------------------------
# Published on: Friday, 8th November 2002, 06:00 pm
# Solved by   : 50440 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution30 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 5

      # solved:
      self.mark_as_solved

      # code:
      # we stop when the k-digit number will always be greater than k * (9^n)
      sum = 0; number = 1
      while true
        number += 1
        digits = number.to_s.split("").map(&:to_i)
        next if digits.length < 2
        return sum if 10**(digits.length-1) > digits.length * (9**n)
        sum += number if number == digits.inject(0) {|s, k| s + k ** n}
      end
    end
  end
end
