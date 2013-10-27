#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=4
# ============================================================================
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.
# ----------------------------------------------------------------------------
# Published on: Friday, 16th November 2001, 06:00 pm
# Solved by   : 182258 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution4 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 3
      raise ArgumentError, "Don't you think, n = #{n} is too big for me to handle?" if n > 5

      # solved:
      self.mark_as_solved

      # code:
      # 999999 998899 997799 ..
      ms = []
      max = 10**(n) - 1
      min = 10**(n-1)
      range = (min..max).to_a.reverse
      range.each do |i|
        range.each do |j|
          m = (i * j)
          break if m < 100001
          ms.push m
          # it will be a bad idea to do: ms.push m if m.to_s == m.to_s.reverse
          # and, will instead be more efficient to sort all products and detect the first palindrome
          # benchmarks: former: ~ 0.25 seconds | later: ~ 0.70 seconds
        end
      end

      ms.sort.reverse.detect{|a| a.to_s == a.to_s.reverse }
    end
  end
end
