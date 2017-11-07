require_relative "../lib/entry"

describe Entry do
  describe "#valid?" do
    it "returns true if the Entry has a valid checksum" do
      entry = Entry.new(
        [
          Digit.new(3),
          Digit.new(4),
          Digit.new(5),
          Digit.new(8),
          Digit.new(8),
          Digit.new(2),
          Digit.new(8),
          Digit.new(6),
          Digit.new(5),
        ]
      )

      expect(entry).to be_valid
    end

    it "returns false if the Entry has a invalid checksum" do
      entry = Entry.new(
        [
          Digit.new(2),
          Digit.new(4),
          Digit.new(5),
          Digit.new(8),
          Digit.new(8),
          Digit.new(2),
          Digit.new(8),
          Digit.new(6),
          Digit.new(5),
        ]
      )

      expect(entry).to_not be_valid
    end

    it "returns false if the Entry contains an illegible digit" do
      entry = Entry.new(
        [
          Digit.new(3),
          Digit.new(4),
          IllegibleDigit.new,
          Digit.new(8),
        ]
      )

      expect(entry).to_not be_valid
    end
  end

  describe "#to_s" do
    it "delegates to the #to_s of the Digits and joins the results" do
      entry = Entry.new([Digit.new(1), Digit.new(2)])

      expect(entry.to_s).to eq("12")
    end
  end
end
