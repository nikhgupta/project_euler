#!/usr/bin/env ruby
# encoding: utf-8

# This file can be included in a solution of ProjectEuler problem to give it
# superpowers.

module ProjectEuler
  class BaseSolution

    attr_reader :id, :solved

    def initialize
      @solved   = false
      @solution = {}
    end

    def pending?
      self.solved != true
    end

    def mark_as_solved
      @solved = true
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
