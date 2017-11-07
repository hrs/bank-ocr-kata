require_relative "../digit_parser"

describe "DigitParser" do
  it "parses a correctly formatted number into a Digit" do
    block = [
      "   ",
      "  |",
      "  |",
    ]

    digit = DigitParser.new(block).parse

    expect(digit.value).to eq(1)
    expect(digit.source_block).to eq(block)
  end

  it "identifies an incorrectly formatted number as illegible" do
    block = [
      "___",
      "| |",
      "| |",
    ]

    digit = DigitParser.new(block).parse

    expect(digit).not_to be_legible
    expect(digit.source_block).to eq(block)
  end
end
