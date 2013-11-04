#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=10
# ============================================================================
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# ----------------------------------------------------------------------------
# Published on: Friday, 8th February 2002, 06:00 pm
# Solved by   : 135743 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution10 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 2000000

      # solved:
      self.mark_as_solved

      # code:
      solve1(n)     # Time: ~05 sec
      # solve2(n)   # Time: ~16 sec
    end

    def solve1(n)
      require 'prime'
      Prime.take_while{|k| k < n}.inject(&:+)
    end

    def solve2(n)
      sum = 5; k = 5
      while k < n
        sum += k if is_prime?(k)
        k += 1
      end; sum
    end

    def is_prime?(k)
      (2..(Math.sqrt(k).to_i)).each do |x|
        return false if k % x == 0
      end; true
    end
  end
end
