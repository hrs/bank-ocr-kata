require_relative "entry"

class ParsingError < ArgumentError
end

class EntryParser
  def initialize(source)
    @source = source
  end

  def parse
    assert_source_dimensions

    Entry.new(digits)
  end

  private

  attr_reader :source

  def assert_source_dimensions
    if source.size != 3
      raise ParsingError, "input to EntryParser should contain exactly 3 lines"
    end

    if source.any? { |line| line.size != 27 }
      raise ParsingError, "every line in the input to EntryParser should contain exactly 27 characters"
    end
  end

  def digits
    blocks.map { |block|
      DigitParser.new(block).parse
    }
  end

  def blocks
    triples = source.map { |line| three_character_substrings(line) }

    triples[0].zip(triples[1], triples[2])
  end

  def three_character_substrings(line)
    line.chars.each_slice(3).map(&:join)
  end
end
