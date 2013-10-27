#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=14
# ============================================================================
# The following iterative sequence is defined for the set of positive integers:
# 
# n n/2 (n is even)n  3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following
# sequence:
# 13  40  20  10  5  16  8  4  2  1
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
      # this method should start execution to return the answer to the problem.

      # uncomment the following, when you have solved this problem.
      # self.mark_as_solved

      # start writing your code now..
    end
  end
end
