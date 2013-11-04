#!/usr/bin/env ruby
# encoding: utf-8

# This file can be included in a solution of ProjectEuler problem to give it
# superpowers.

module ProjectEuler
  class BaseSolution

    attr_reader :solved, :params

    def initialize
      @solved   = false
      @solution = {}
    end

    def id
      self.class.to_s.gsub("ProjectEuler::Solution", "").to_i
    end

    def params=(args = [])
      @params = args
    end

    def pending?
      self.solved != true
    end

    def mark_as_solved
      @solved = true
    end

    def read_data_from_input_file
      file = File.join(File.dirname(File.dirname(__FILE__)), "data", "problem-#{self.id.to_s}.txt")
      File.read file
    end

    def try_solution
      start                  = Time.now
      return unless @solution.empty?
      @solution[:answer]     = self.solve
      @solution[:time_taken] = Time.now - start
    end

    def time
      try_solution
      @solution[:time_taken]
    end

    def answer
      try_solution
      @solution[:answer]
    end

  end
end
