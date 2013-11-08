#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=32
# ============================================================================
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.
# ----------------------------------------------------------------------------
# Published on: Friday, 6th December 2002, 06:00 pm
# Solved by   : 31734 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution32 < BaseSolution

    def solve

      # solved:
      self.mark_as_solved

      # code:
      arr = []
      (1..99).each do |i|
        (100..9999).each do |j|
          p = i * j
          arr.push p if pandigital?(i,j,p)
          break if p > 9999
        end
      end

      # answer
      arr.uniq.inject(0){|sum, k| sum + k}
    end

    private

    def pandigital?(i,j,p)
      str = "#{i}#{j}#{p}"
      return false unless str.length == 9
      ('1'..'9').to_a == str.split("").sort
    end
  end
end
