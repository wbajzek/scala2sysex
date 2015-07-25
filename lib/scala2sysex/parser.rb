module Scala2sysex
  class Parser
    def initialize(input)
      @lines = input.split(/\n/)
      raise "Invalid scala" unless valid?
    end

    def name
      @name ||= content_lines.first
    end

    def number_of_degrees
      @number_of_degrees ||= content_lines[1].to_i
    end

    def degrees
      @degrees ||= content_lines[2..-1]
    end

    private

    def content_lines
      @content_lines ||= @lines.reject { |l|
        l[0] == '!' || l.empty?
      }
    end

    def valid?
      degrees.count == number_of_degrees
    end
  end
end
