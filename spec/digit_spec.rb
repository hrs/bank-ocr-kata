require_relative "../lib/digit"

describe Digit do
  describe "#to_s" do
    it "returns the value of the digit" do
      irrelevant_block = nil
      digit = Digit.new(5, irrelevant_block)

      expect(digit.to_s).to eq("5")
    end
  end
end
