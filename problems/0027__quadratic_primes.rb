#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=27
# ============================================================================
# Euler discovered the remarkable quadratic formula:
# n² + n + 41
# It turns out that the formula will produce 40 primes for the consecutive
# values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is
# divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly
# divisible by 41.
# The incredible formula  n² - 79n + 1601 was discovered, which produces 80
# primes for the consecutive values n = 0 to 79. The product of the
# coefficients, -79 and 1601, is -126479.
# Considering quadratics of the form:
# 
# n² + an + b, where |a| < 1000 and |b| < 1000, where |n| is the modulus/absolute
# value of n, e.g. |11| = 11 and |-4| = 4
# 
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n,
# starting with n = 0.
# ----------------------------------------------------------------------------
# Published on: Friday, 27th September 2002, 06:00 pm
# Solved by   : 39231 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'prime'

module ProjectEuler
  class Solution27 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000

      # solved:
      self.mark_as_solved

      # code:
      max_primes = max_a = max_b = 0
      (1-n..n-1).each do |a|
        (1..n-1).each do |b|
          next unless b.prime?
          x = 0
          prime_count = 0
          while true
            x += 1
            quad = x**2 + a*x + b
            if quad.prime?
              prime_count += 1
            elsif max_primes < prime_count
              max_primes = prime_count
              max_a = a
              max_b = b
              break
            else
              break
            end
          end
        end
      end

      # answer => a: -61, b: 971, primes: 71
      max_a * max_b
    end
  end
end
