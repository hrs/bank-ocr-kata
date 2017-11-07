require "tempfile"

require_relative "../lib/entry_file"

describe EntryFile do
  describe "#entries" do
    it "returns the Entry objects defined in the supplied file" do
      file_contents = [
        " _  _  _  _  _  _  _  _  _ ",
        "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
        "|_||_||_||_||_||_||_||_||_|",
        "",
        " _  _  _  _  _  _  _  _  _ ",
        "  |  |  |  |  |  |  |  |  |",
        "  |  |  |  |  |  |  |  |  |",
        "",
        " _  _  _  _  _  _  _  _  _ ",
        "|_||_||_||_||_||_||_||_||_|",
        "|_||_||_||_||_||_||_||_||_|",
        "",
      ]
      tempfile = Tempfile.new("test_entries")
      tempfile.write(file_contents.join("\n"))
      tempfile.rewind

      entries = EntryFile.new(tempfile).entries

      expect(entries.map(&:to_s)).to eq(
        [
          "666666666",
          "777777777",
          "888888888",
        ]
      )

      tempfile.close
    end
  end
end
