#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=5
# ============================================================================
# 2520 is the smallest number that can be divided by each of the numbers from
# 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
# ----------------------------------------------------------------------------
# Published on: Friday, 30th November 2001, 06:00 pm
# Solved by   : 197052 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution5 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 20

      # solved:
      self.mark_as_solved

      # code:
      ans = 1
      (1..n).each { |k| ans *= (k/gcd(ans,k)) }

      # answer:
      ans
    end

    def gcd(q,d)
      d, q = [ q, d ].sort
      r = q % d
      while true
        return d if r == 0
        q = d; d = r; r = q % d
      end
    end
  end
end
