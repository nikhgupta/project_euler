#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=15
# ============================================================================
#
# Starting in the top left corner of a 2x2 grid, and only being able to move
# to the right and down, there are exactly 6 routes to the bottom right
# corner.
#
# :image(https://projecteuler.net/project/images/p_015.gif)
#
# How many such routes are there through a 20x20 grid?
# ----------------------------------------------------------------------------
# Published on: Friday, 19th April 2002, 06:00 pm
# Solved by   : 79909 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution15 < BaseSolution

    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 20


      # solved:
      self.mark_as_solved

      # code:
      route(n, n, 0, 0, n-1, n-1)
    end

    # find routes from (i,j) to (k,l) in a mXn grid
    def route(m, n, i, j, k, l)
      return 0 if i > k || j > l
      start_to_end(k-i+1, l-j+1)
    end

    # find routes from start point to diagonally end point, i.e.
    # find routes from (0, 0) to (m-1, n-1) in a mXn grid
    def start_to_end(m, n)
      combinatorics(m+n, [m,n].max)
    end

    def combinatorics(n,k)
      num = den = 1
      (1..k).each do |i|
        num *= (n - i + 1)
        den *= i
      end
      num / den
    end
  end
end
