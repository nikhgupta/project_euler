require 'pry'
require 'yaml'
require 'mechanize'

module ProjectEuler
  module Helper
    PATH      = File.dirname(File.dirname(__FILE__))
    AGENT     = Mechanize.new{ |a| a.user_agent_alias = 'Mac Safari' }
    DATA_FILE = File.join(PATH, "data", "data.yml")

    attr_reader :id

    def id=(id=nil)
      @id = id.to_i
      raise ArgumentError, "You must set a valid problem ID!" unless @id > 0
      print "#{"%04d" % @id} | "
    end

    def url
      "https://projecteuler.net/problem=#{@id}"
    end

    def data_for
      page         = AGENT.get self.url
      title        = page.search("#content > h2").text
      problem      = page.search("#content > .problem_content").text.strip
      meta         = page.search("#content span").text.strip
      published_on = meta.match(/^Published on(.*); Solved/)[1].strip rescue nil
      solved_by    = meta.match(/; Solved by (\d*)$/)[1].strip.to_i rescue 0
      { title: title, content: problem, published_on: published_on, solved_by: solved_by }
    end

    def save_data_as_yaml
      data = YAML.load_file(DATA_FILE) rescue {}
      return data[@id] if data[@id]
      data[@id] = self.data_for
      File.open(DATA_FILE, "w") { |f| f.puts data.to_yaml }
      data[@id]
    end

    def problem_file
      return nil unless @id > 0
      data = YAML.load_file(DATA_FILE) rescue {}
      return nil if data.empty?
      path = self.friendly_filename(data[@id][:title].downcase)
      File.join(PATH, "problems", "#{"%04d" % @id}__#{path}.rb")
    end

    protected

    def shorten(string, count = 45)
      if string.length >= count
        shortened = string[0, count]
        splitted = shortened.split(/\s/)
        words = splitted.length
        splitted[0, words-1].join(" ") + ' ...'
      else
        string + ( " " * (count + 1 - string.length))
      end
    end

    def friendly_filename(filename)
      filename.gsub(/[^\w\s_-]+/, '')
      .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      .gsub(/\s+/, '_')
    end
  end
end
