#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=31
# ============================================================================
# In England the currency is made up of pound, £, and pence, p, and there are
# eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
# 1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
# How many different ways can £2 be made using any number of coins?
# ----------------------------------------------------------------------------
# Published on: Friday, 22nd November 2002, 06:00 pm
# Solved by   : 36690 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution31 < BaseSolution

    # this is a starred problem for me :)
    def solve
      # set default query:
      n = @params[0].to_i
      n = n > 0 ? n : 200

      # solved:
      self.mark_as_solved

      # logic:
      # we need to find the integral solutions for:
      # a + 2b + 5c + 10d + 20e + 50f + 100g + 200h = 200
      # number of coins can range from 1..200

      # code:
      # denoms = [1, 2, 5, 10, 20, 50, 100, 200]

      count = 0
      n.step(0, -200) do |a|
        a.step(0, -100) do |b|
          b.step(0, -50) do |c|
            c.step(0, -20) do |d|
              d.step(0, -10) do |e|
                e.step(0, -5) do |f|
                  f.step(0, -2) do |g|
                      count += 1
                  end
                end
              end
            end
          end
        end
      end

      # answer
      count
    end
  end
end
