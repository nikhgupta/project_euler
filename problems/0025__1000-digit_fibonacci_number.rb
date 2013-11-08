#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=25
# ============================================================================
# The Fibonacci sequence is defined by the recurrence relation:
# F(n) = F(n-1) + F(n-2), where F(1) = 1 and F(2) = 1.
# Hence the first 12 terms will be:
# F(1)  =   1
# F(2)  =   1
# F(3)  =   2
# F(4)  =   3
# F(5)  =   5
# F(6)  =   8
# F(7)  =  13
# F(8)  =  21
# F(9)  =  34
# F(10) =  55
# F(11) =  89
# F(12) = 144
# The 12th term, F(12), is the first term to contain three digits.
# What is the first term in the Fibonacci sequence to contain 1000 digits?
# ----------------------------------------------------------------------------
# Published on: Friday, 30th August 2002, 06:00 pm
# Solved by   : 71280 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution25 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # code:
      solve2(n)
    end

    def solve2(n)
      prev1 = prev2 = [1]
      counter = 2
      while true
        next_fibo = digit_sum_arrays_reversed(prev1, prev2)
        prev1 = prev2
        prev2 = next_fibo
        counter += 1
        return counter if next_fibo.length >= n
      end
    end

    def solve1(n)
      require 'bigdecimal'
      prev1 = prev2 = 1
      counter = 2
      limit = BigDecimal.new(10).power(n-1)
      while true
        current = BigDecimal.new(prev1) + BigDecimal.new(prev2)
        counter += 1
        return counter if current >= limit
        prev2 = prev1
        prev1 = current
      end
    end

    private

    def digit_sum_arrays_reversed(lower, higher)
      sum  = []; carry = 0
      higher.each_with_index do |v, i|
        v += lower[i].to_i + carry
        if v > 9
          sum[i] = v - 10
          carry  = 1
          sum[i+1] = sum[i+1] ? sum[i+1] + 1 : 1
        else
          sum[i] = v
          carry  = 0
        end
      end
      sum
    end
  end
end
