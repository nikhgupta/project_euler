#!/usr/bin/env ruby
# encoding: utf-8

# a script to fetch a problem from projecteuler.net, and create a new ruby file in the current directory, having the
# contents of the problem in comments.

# require the helper
require File.dirname(File.dirname(__FILE__)) + '/lib/helper.rb'

class ProjectEuler::Solution
  include ProjectEuler::Helper

  # create a file in the current directory for the given problem
  def check
    file = self.problem_file
    data = self.save_data_as_yaml
    print "#{shorten(data[:title])} | "
    require file
    solution = ProjectEuler.const_get("Solution#{@id}").new
    solution.try_solution
    if solution.pending?
      puts "Solution is pending!"
    else
      puts "It took me: #{"%02f" % solution.time} seconds. | Solution: #{solution.answer}"
    end
  rescue Exception => e
    puts "Encountered an error: #{e.message}!"
  end
end

solution = ProjectEuler::Solution.new
solution.id = ARGV.shift || 1
solution.check
