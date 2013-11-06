#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=26
# ============================================================================
# A unit fraction contains 1 in the numerator. The decimal representation of
# the unit fractions with denominators 2 to 10 are given:
# 1/2= 0.5
# 1/3= 0.(3)
# 1/4= 0.25
# 1/5= 0.2
# 1/6= 0.1(6)
# 1/7= 0.(142857)
# 1/8= 0.125
# 1/9= 0.(1)
# 1/10= 0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.
# ----------------------------------------------------------------------------
# Published on: Friday, 13th September 2002, 06:00 pm
# Solved by   : 37143 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'prime'
require 'bigdecimal'

module ProjectEuler
  class Solution26 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # code:
      # period of such a cycle is the least k such that 10^k-1 is divisible by the number (p)
      # in other words, multiplicative order of 10 modulo p
      # note that the order must divide euler totient function, which for prime p is p-1
      return 3 if n < 7
      number = 0; max_period = 0
      (7..n-1).each do |k|
        next unless k.prime?
        # period = via_successive_remainder_check(k) # 12.936391 seconds for n = 10000
        period = via_power_check(k)                  # 04.866322 seconds for n = 10000
        # puts "#{k} => #{period}"
        if max_period < period
          number = k
          max_period = period
        end
      end

      # answer: 983 with a cycle of 982 decimals
      number
    end

    # assumes prime numbers are fed
    # multiplies by 10 each time and checks to see if remainder is 1
    def via_successive_remainder_check(k)
      r = 0; p = 1
      while r < k
        r += 1; p *= 10
        next if k % r != 1
        return r if p % k == 1
      end
    end

    # computes 10^r-1 and divides to see if remainder is 1
    def via_power_check(k)
      r = 0
      while r < k
        r += 1
        next if k % r != 1
        return r if r == k-1
        p = (BigDecimal.new("10").power(r) - 1)/k.to_f
        return r if p == p.to_i
      end
    end
  end
end
