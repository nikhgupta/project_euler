#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=9
# ============================================================================
# A Pythagorean triplet is a set of three natural numbers, a b c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find
# the product abc.
# ----------------------------------------------------------------------------
# Published on: Friday, 25th January 2002, 06:00 pm
# Solved by   : 148732 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution9 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # logic:
      # solving, we get:
      # b = ( 5 * 10^5 - 1000) / (1000 - a)
      # c = 1000 - (a + b)
      # we have our solution, when for integral 'a', we have integral 'b'
      # solution => a: 200 | b: 375 | c: 425

      # code:
      (1..499).each do |a|
        b = (500000 - 1000 * a) / (1000 - a).to_f
        return (a * b * (1000 - (a + b))).to_i if b.floor == b
      end
    end
  end
end
