#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=20
# ============================================================================
# n! means n x (n - 1) x ...  3 x 2 x 1
# For example, 10! = 10 x 9 x ... 3 x 2 x 1 = 3628800,and the sum of the digits
# in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!
# ----------------------------------------------------------------------------
# Published on: Friday, 21st June 2002, 06:00 pm
# Solved by   : 94388 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'bigdecimal'

module ProjectEuler
  class Solution20 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 100

      # solved:
      self.mark_as_solved

      # code:
      factorial(n).to_i.to_s.split("").map(&:to_i).inject(0) {|sum, k| sum + k}
    end

    def factorial(k)
      return BigDecimal.new(1) if k == 1
      k * factorial(k-1)
    end
  end
end
