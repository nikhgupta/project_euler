#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=7
# ============================================================================
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# What is the 10 001st prime number?
# ----------------------------------------------------------------------------
# Published on: Friday, 28th December 2001, 06:00 pm
# Solved by   : 169363 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution7 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 10001

      # solved:
      self.mark_as_solved

      # code:
      counter = 2
      k = 5
      while true
        counter += 1 if is_prime?(k)
        return k if counter == n
        k += 1
      end
    end

    def is_prime?(k)
      (2..(Math.sqrt(k).to_i)).each do |x|
        return false if k % x == 0
      end
      true
    end
  end
end
