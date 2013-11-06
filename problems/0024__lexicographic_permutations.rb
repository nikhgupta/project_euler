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
      # self.mark_as_solved

      # code:
      k = 9
      memo = {counted: 0, recent: 0, answer: ""}
      while memo[:counted] < n
        perms = factorial(k)
        memo[:recent]   = (n - memo[:counted]) / perms
        memo[:counted] += memo[:recent] * perms
        memo[:answer]  += memo[:recent].to_s
        k -= 1
      end

      memo[:answer]
    end

    def factorial(n)
      n == 1 ? 1 : n * factorial(n-1)
    end
  end
end
