require_relative "digit"
require_relative "illegible_digit"

class DigitParser
  def initialize(block)
    @block = block
  end

  def parse
    if parsed_value
      Digit.new(parsed_value, block)
    else
      IllegibleDigit.new(block)
    end
  end

  private

  attr_reader :block

  BLOCKS = {
    [
      " _ ",
      "| |",
      "|_|",
    ] => 0,
    [
      "   ",
      "  |",
      "  |",
    ] => 1,
    [
      " _ ",
      " _|",
      "|_ ",
    ] => 2,
    [
      " _ ",
      " _|",
      " _|",
    ] => 3,
    [
      "   ",
      "|_|",
      "  |",
    ] => 4,
    [
      " _ ",
      "|_ ",
      " _|",
    ] => 5,
    [
      " _ ",
      "|_ ",
      "|_|",
    ] => 6,
    [
      " _ ",
      "  |",
      "  |",
    ] => 7,
    [
      " _ ",
      "|_|",
      "|_|",
    ] => 8,
    [
      " _ ",
      "|_|",
      " _|",
    ] => 9,
  }

  def parsed_value
    BLOCKS[block]
  end
end
