#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=23
# ============================================================================
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less
# than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.
# ----------------------------------------------------------------------------
# Published on: Friday, 2nd August 2002, 06:00 pm
# Solved by   : 45218 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'
require 'benchmark'

module ProjectEuler
  class Solution23 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 28123

      # solved:
      self.mark_as_solved

      # code:

      # solve1(n)         #  5000: 21.38s user 0.16s system 99% cpu 21.579 total

      # solve2(n)         #  5000:  4.06s user 0.11s system 99% cpu  4.175 total
                          # 10000: 14.61s user 0.13s system 99% cpu 14.752 total
                          # 15000: 31.80s user 0.15s system 99% cpu 31.980 total

      # solve3(n)         #  5000:  4.20s user 0.12s system 93% cpu  4.608 total
                          # 10000: 10.30s user 0.13s system 96% cpu 10.813 total
                          # 15000: 19.98s user 0.15s system 98% cpu 20.413 total
                          #     n: 52.27s user 0.21s system 99% cpu 52.993 total

      # solve4(n)         #  5000:  4.24s user 0.12s system 93% cpu  4.642 total
                          # 10000: 10.39s user 0.13s system 99% cpu 10.530 total
                          # 15000: 19.91s user 0.14s system 99% cpu 20.068 total
                          #     n: 52.07s user 0.20s system 99% cpu 52.328 total

      # solve5(n)         #  5000:  1.08s user 0.11s system 99% cpu  1.191 total
                          # 10000:  1.73s user 0.12s system 86% cpu  2.133 total
                          # 15000:  2.71s user 0.13s system 99% cpu  2.848 total
                          #     n:  7.40s user 0.21s system 99% cpu  7.629 total

      solve6(n)           #     n:  3.64s user 0.11s system 99% cpu  3.762 total
    end

    def solve6(n)
      abus = abundant_numbers_lower_than(n)
      flag = Array.new(n, false)
      abus.each_with_index do |abu, i|
        abus[abus.index(abu)..-1].each do |abu2|
          break if abu + abu2 > n
          flag[abu + abu2] = true
        end
      end

      sum = 0
      (1..n).each {|k| sum += k unless flag[k]}
      sum
    end

    def solve5(n)
      abus = abundant_numbers_lower_than(n)
      sums = []
      abus.each do |i|
        abus.each do |j|
          break if i + j > n
          sums.push(i + j)
        end
      end

      ((n * (n+1)) / 2) - sums.uniq.inject(0) {|sum, k| sum + k }
    end

    def solve4(n)
      sum  = 0
      abus = abundant_numbers_lower_than(n)
      (1..n).each do |i|
        valid = abus.detect {|k| i-k }
        sum  += i unless valid
      end; sum
    end

    def solve3(n)
      arr  = (1..n).to_a
      abus = abundant_numbers_lower_than(n)
      abus.each do |k|
        arr.reject!{ |i| abundant?(i-k)}
      end

      arr.inject(0) {|sum, i| sum + i}
    end

    def solve2(n)
      sum  = 0
      abus = abundant_numbers_lower_than(n)

      (1..n).each do |i|
        lower = abus.select {|k| k < i}
        diffs = abus.map {|k| i - k}
        inter = lower & diffs
        sum  += i if inter.empty?
      end; sum
    end

    def solve1(n)
      sum  = 0
      abus = abundant_numbers_lower_than(n)
      (1..n).each do |i|
        lower_abus = abus.select{|k| k < i}
        expressible = false
        lower_abus.each do |k|
          if lower_abus.include?(i - k)
            expressible = true
            break
          end
        end
        # numbers.push i unless expressible
        sum += i unless expressible
      end; sum
    end

    private

    # abundants are found in multiples (observation)
    # and therefore, we only need the base generators
    def generators_for_abundants_lower_than(k)
      arr = []
      (1..k).each do |i|
       arr.push i if abundant?(i) && arr.select{|m| i % m == 0}.empty?
      end; arr
    end

    def abundant_numbers_lower_than(k)
      (1..k).select{|i| abundant?(i)}
    end

    def abundant?(k)
      return false if k < 12
      s = Math.sqrt(k)
      sum = (s == s.to_i ? -s : 0)
      (2..s.to_i).each do |i|
        sum += i + (k/i) if k % i == 0
        return true if sum > k
      end; sum > k
    end
  end
end
