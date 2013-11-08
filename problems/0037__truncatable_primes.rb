#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=37
# ============================================================================
# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime
# at each stage: 3797, 797, 97, and 7. Similarly we can work from right to
# left: 3797, 379, 37, and 3.
# Find the sum of the only eleven primes that are both truncatable from left
# to right and right to left.
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
# ----------------------------------------------------------------------------
# Published on: Friday, 14th February 2003, 06:00 pm
# Solved by   : 33921 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'prime'

module ProjectEuler
  class Solution37 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 11

      # solved:
      self.mark_as_solved

      # code:
      solve1(n)
      # solve2(n)
    end

    def solve2(n)
      # read: https://projecteuler.net/quote_post=140677-8c849
      # base = [2,3,5,7]
      # mids = [1,3,7,9]
    end

    def solve1(n)
      arr = []
      counter = 20000
      max_prime = 0
      while true
        break if n == 0
        primes = Prime.first(counter)
        primes.each do |i|
          next if i < max_prime
          if truncatable_prime?(i)
            arr.push i
            n -= 1
          end
        end
        max_prime = primes.last
        counter += 20000
      end

      # answer
      arr.inject(0) {|sum, k| sum + k}
    end

    def related_primes(k)
      ko = k.to_s.split("")
      ki = k.to_s.split("")
      ln = ko.length-1
      arr = [k]
      (1..ln).each do |i|
        ko.pop; ki.shift
        arr.push << ko.join("").to_i << ki.join("").to_i
      end; arr
    end

    def truncatable_prime?(k)
      return false if k < 10
      unit_digit = k % 10
      return false unless unit_digit == 3 || unit_digit == 7
      related_primes(k).reject{|i| i.prime?}.empty?
    end
  end
end
