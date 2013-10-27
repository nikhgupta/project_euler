#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=6
# ============================================================================
# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.
# ----------------------------------------------------------------------------
# Published on: Friday, 14th December 2001, 06:00 pm
# Solved by   : 198799 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution6 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 100

      # solved:
      self.mark_as_solved

      # logic:
      #
      #                           n * (n + 1)
      # sum of first n numbers = -------------
      #                                2
      #
      #                           n * (n + 1) * (2n + 1)
      # sum of first n squares = ------------------------
      #                                     6

      # code:
      # ((n*(n+1))/2)**2 - (n*(n+1)*(2*n + 1))/6
      (n * (n+1) * (3*n*n - n - 2))/12
    end
  end
end
