#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=24
# ============================================================================
# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order.
# The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?
# ----------------------------------------------------------------------------
# Published on: Friday, 16th August 2002, 06:00 pm
# Solved by   : 52579 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution24 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000000

      # solved:
      self.mark_as_solved

      # gotchas with "n"
      return "max value of n is restricted to 3628799" if n >= factorial(10)

      # code:
      solve2(n)
    end

    def solve2(n)
      n -= 1
      number = ""
      unused = (0..9).to_a
      while unused.any?
        f  = factorial(unused.length - 1)
        q  = n / f
        n %= f
        number += unused[q].to_s
        unused.delete_at(q)
      end
      number
    end

    def solve1(n)
      digit   = 0   # current digit
      level   = 9   # current permutation level
      number  = ""
      unused  = (0..9).to_a
      counter = 0
      while unused.any?
        permutations = factorial(level)
        if n <= permutations
          counter = 0
          level -= 1
          number += digit.to_s
          unused.delete(digit)
          digit = unused[0]
        else
          counter += 1
          n -= permutations
          digit = unused[counter]
        end
      end
      number
    end

    def factorial(n)
      n < 2 ? 1 : n * factorial(n-1)
    end
  end
end
