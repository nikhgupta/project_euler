#!/usr/env/bin ruby
# encoding: utf-8

# The Problem: https://projecteuler.net/problem=22
# ============================================================================
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a
# name score.
# For example, when the list is sorted into alphabetical order, COLIN, which
# is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 x 53 = 49714.
# What is the total of all the name scores in the file?
# ----------------------------------------------------------------------------
# Published on: Friday, 19th July 2002, 06:00 pm
# Solved by   : 60513 users.
# ----------------------------------------------------------------------------

require File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'

module ProjectEuler
  class Solution22 < BaseSolution

    def solve
      # set default query:
      n = self.input

      # solved:
      self.mark_as_solved

      # code:
      n.sort!
      sum = 0
      n.each_with_index do |v, i|
        sum += name_score(v, i+1)
      end
      
      # answer
      sum
    end

    def name_score(name, index = 1)
      (name.downcase.sum - (96 * name.length)) * index
    end

    def input
      self.read_data_from_input_file.gsub('"', '').split(",")
    end
  end
end
