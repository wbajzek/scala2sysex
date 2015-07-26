module Scala2sysex
  class Parser
    DEGREES = 12
    BASE_CENTS = Array.new(12).collect.with_index { |x, i|
      100.0 * (i+1)
    }
    HEADER_1BYTE = ["f0","7f","00","08","08","03","7f","7f"]
    TERMINATOR = ["f7"]
    FORMAT_1BYTE = 'CCCCCCCCCCCCCCCCCCCCC'

    def initialize(input)
      @lines = input.split(/\n/)
      raise "Invalid input" unless valid?
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

    def offsets_1byte
      rotate(offsets.collect { |offset| "%02x" % (64 + offset) })
    end

    def to_1byte_octave_sysex
      (HEADER_1BYTE + offsets_1byte +
       TERMINATOR).map(&:hex).pack(FORMAT_1BYTE)
    end

    private

    def multipliers
      degrees.collect { |degree|
        multiplier(degree.split(/!/).first)
      }
    end

    def offsets
      multipliers.collect.each_with_index { |offset, i|
        offset - BASE_CENTS[i]
      }
    end

    def rotate(arr)
      arr.unshift(arr.pop)
    end

    def content_lines
      @content_lines ||= @lines.reject { |l|
        l[0] == '!' || l.empty?
      }
    end

    def valid?
      degrees.count == number_of_degrees &&
        number_of_degrees == DEGREES
    end

    def multiplier(degree)
      if degree.include?('.')
        degree.to_f
      else
        if degree.include?('/')
          numerator, denominator = degree.split(/\//)
        else
          numerator = degree
          denominator = 1.0
        end
        1200.0 * Math.log2(numerator.to_f / denominator.to_f)
      end
    end
  end
end
