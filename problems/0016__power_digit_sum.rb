#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=16
# ============================================================================
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?
# ----------------------------------------------------------------------------
# Published on: Friday, 3rd May 2002, 06:00 pm
# Solved by   : 102002 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution16 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 1000


      # solved:
      self.mark_as_solved

      # code:
      arr = [1]; counter = 0
      while counter < n
        arr.each_with_index do |v, i|
          if v >= 5
            arr[i] = arr[i] * 2 - 10
            if arr[i+1]
              arr[i+1] += 0.5
            else
              arr[i+1] = 1
              break
            end
          else
            arr[i] *= 2
          end
        end
        counter += 1
      end
      arr.inject(&:+).to_i
    end
  end
end
