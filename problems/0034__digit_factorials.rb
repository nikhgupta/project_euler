#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=34
# ============================================================================
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of
# their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
# ----------------------------------------------------------------------------
# Published on: Friday, 3rd January 2003, 06:00 pm
# Solved by   : 44125 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution34 < BaseSolution

    def solve
      n = find_upper_bound

      # solved:
      self.mark_as_solved

      # code:
      arr = []
      factorial = (0..9).map{|i| factorial(i)}
      (3..n).each do |k|
        sum = 0; ko = k
        while k > 0
          sum += factorial[k % 10]
          break if sum > ko
          k /= 10
        end
        arr.push ko if sum == ko
      end

      # answer
      arr.inject(0) {|sum, k| sum + k}
    end

    private

    def find_upper_bound
      counter = 1
      f9  = factorial(9)
      while true
        return 10**counter-1 if f9 * counter < 10 ** counter - 1
        counter += 1
      end
    end

    def factorial(k)
      k < 2 ? 1 : k * factorial(k-1)
    end

  end
end
