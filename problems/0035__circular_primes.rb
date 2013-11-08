#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=35
# ============================================================================
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.
# How many circular primes are there below one million?
# ----------------------------------------------------------------------------
# Published on: Friday, 17th January 2003, 06:00 pm
# Solved by   : 40312 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'prime'

module ProjectEuler
  class Solution35 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000000

      # solved:
      self.mark_as_solved

      # code:
      arr = [2,5]
      invalid_digits = ["0", "2", "4", "5", "6", "8"]
      Prime.each(n) do |i|

        digits = i.to_s.split("")
        next if (digits & invalid_digits).any?

        # next if arr.include?(i)
        arr |= cyclic_prime?(digits)
      end

      # answer
      arr.count
    end

    private

    def cycles(k)
      len = k.length
      arr = [ k.join("").to_i ]
      while len > 0
        h = k.shift
        k.push h
        arr[len - 1] = k.join("").to_i
        len -= 1
      end
      arr
    end

    def cyclic_prime?(k)
      c = cycles(k)
      c.each do |p|
        return [] unless p.prime?
      end; c
    end
  end
end
