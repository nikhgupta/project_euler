#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=3
# ============================================================================
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# ----------------------------------------------------------------------------
# Published on: Friday, 2nd November 2001, 06:00 pm
# Solved by   : 199575 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution3 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 600851475143

      # solved:
      self.mark_as_solved

      # code:
      lower_divisors_of(n).detect{|i| is_prime?(i)}
    end

    def lower_divisors_of(n)
      data = (2..(Math.sqrt(n).to_i)).select{ |a| n % a == 0 }
      data.map{|a| [a, n/a]}.flatten.sort.reverse
    end

    def is_prime?(n)
      lower_divisors_of(n).empty?
    end
  end
end
