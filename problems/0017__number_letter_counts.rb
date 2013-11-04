#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=17
# ============================================================================
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.
# ----------------------------------------------------------------------------
# Published on: Friday, 17th May 2002, 06:00 pm
# Solved by   : 66156 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution17 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # no other "n" would work
      return "Solution is bound for n = 1000" unless n == 1000

      # code:
      # 36: one, two, three, four, five, six, seven, eight, nine
      # 70: ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
      # 47: twenty, thirty, fourty, fifty, sixty, seventy, eighty, ninety
      # 10: hundred
      # 08: thousand

      count = {}
      # count from 1 to 99
      count[:d1_9]   = 36
      count[:d11_19] = 70
      count[:d10x]   = 46
      count[:d1_99]  = 9 * count[:d1_9] + count[:d11_19] + count[:d10x] * 10

      # count from 1 to 999
      count[:d100]   = 7 # hundred
      count[:dand]   = 3 # and
      count[:d1_999] = count[:d1_99] * 10 + 900 * count[:d100] + 100 * count[:d1_9] + 99 * 9 * count[:dand]

      # asnwer
      count[:d1_999] + 11
    end
  end
end
