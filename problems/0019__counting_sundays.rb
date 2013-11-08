#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=19
# ============================================================================
# You are given the following information, but you may prefer to do some
# research for yourself.
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century
# unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?
# ----------------------------------------------------------------------------
# Published on: Friday, 14th June 2002, 06:00 pm
# Solved by   : 60067 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution19 < BaseSolution

    def solve
      # set default query: century
      n = @params[0].to_i
      n = n > 0 ? n : 20

      # solved:
      self.mark_as_solved

      # code:
      # monday is 1, and sunday is 7
      counter = 0
      day     = 2        # 1 January, 1901
      year    = 1901
      while year < 2001
        counter += 1 if day % 7 == 0 # january 1
        day += 31
        counter += 1 if day % 7 == 0 # february 1
        day += (leap_year?(year) ? 29 : 28)
        counter += 1 if day % 7 == 0 # march 1
        day += 31
        counter += 1 if day % 7 == 0 # april 1
        day += 30
        counter += 1 if day % 7 == 0 # may 1
        day += 31
        counter += 1 if day % 7 == 0 # june 1
        day += 30
        counter += 1 if day % 7 == 0 # july 1
        day += 31
        counter += 1 if day % 7 == 0 # august 1
        day += 31
        counter += 1 if day % 7 == 0 # september 1
        day += 30
        counter += 1 if day % 7 == 0 # october 1
        day += 31
        counter += 1 if day % 7 == 0 # november 1
        day += 30
        counter += 1 if day % 7 == 0 # december 1
        day += 31
        year += 1
      end

      # answer
      counter
    end

    def leap_year?(year)
      return false if year % 100 == 0 && year % 400 != 0
      year % 4 == 0
    end
  end
end
