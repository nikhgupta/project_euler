#!/usr/bin/env ruby
# encoding: utf-8

# a script to fetch a problem from projecteuler.net, and create a new ruby file in the current directory, having the
# contents of the problem in comments.

# require the helper
require File.dirname(File.dirname(__FILE__)) + '/lib/helper.rb'

class ProjectEuler::Problem
  include ProjectEuler::Helper

  # fetch data for the given problem
  def extract_data
    data                = self.save_data_as_yaml
    data[:published_on] = data[:published_on]  ? "# Published on: #{data[:published_on]}\n" : ""
    data[:solved_by]    = data[:solved_by] > 0 ? "# Solved by   : #{data[:solved_by].to_s} users.\n" : "# This is an unsolved problem."
    data[:content]      = data[:content].scan(/.{1,76}[\b|\W]/).map{ |s| "# " + s.strip }.join("\n")
    data
  end

  # create a file in the current directory for the given problem
  def grab
    data = self.extract_data
    file = self.problem_file
    print "#{shorten(data[:title])} | "
    raise ArgumentError, "Solution file already exists!" if File.exists?(file)

    File.open(file, "w") do |f|
      f.puts  "#!/usr/env/bin ruby"
      f.puts  "# encoding: utf-8"
      f.print "\n# The Problem: #{self.url}\n"
      f.puts  "# " + ("=" * 76)
      f.puts  data[:content]
      f.puts  "# " + ("-" * 76)
      f.print data[:published_on]
      f.print data[:solved_by]
      f.puts  "# " + ("-" * 76)
      f.puts  "\nrequire File.dirname(File.dirname(__FILE__)) + '/lib/base.rb'\n\n"
      f.puts  "module ProjectEuler"
      f.puts  "  class Solution#{@id} < BaseSolution\n\n"
      f.puts  "    def solve"
      f.puts  "      # this method should start execution to return the answer to the problem.\n\n"
      f.puts  "      # uncomment the following, when you have solved this problem."
      f.puts  "      # self.mark_as_solved\n\n"
      f.puts  "      # start writing your code now.."
      f.puts  "    end"
      f.puts  "  end"
      f.puts  "end"
    end

    puts "Created a solution file!"
  rescue Exception => e
    puts "Encountered an error: #{e.message}!"
  end
end

problem = ProjectEuler::Problem.new
problem.id = ARGV.shift || 1
problem.grab
