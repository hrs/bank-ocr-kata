class Entry
  def initialize(digits)
    @digits = digits
  end

  def to_s
    digits.map(&:to_s).join
  end

  private

  attr_reader :digits
end
