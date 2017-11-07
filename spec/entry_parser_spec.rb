require_relative "../lib/entry_parser"

describe EntryParser do
  describe "#parse" do
    it "parses a string containing blocks of digits into Digit objects" do
      entry_source = [
        "    _  _     _  _  _  _  _ ",
        "  | _| _||_||_ |_   ||_||_|",
        "  ||_  _|  | _||_|  ||_| _|",
      ]

      entry = EntryParser.new(entry_source).parse

      expect(entry.to_s).to eq("123456789")
    end

    it "raises an exception if the input doesn't contain exactly 3 lines" do
      entry_source = [
        "    _  _     _  _  _  _  _ ",
        "  | _| _||_||_ |_   ||_||_|",
      ]

      expect {
        EntryParser.new(entry_source).parse
      }.to raise_error(ParsingError)
    end

    it "raises an exception if every line of the input isn't 27 characters" do
      entry_source = [
        "    _  _     _  _",
        "  | _| _||_||_ |_",
        "  ||_  _|  | _||_",
      ]

      expect {
        EntryParser.new(entry_source).parse
      }.to raise_error(ParsingError)
    end
  end
end
