class Digit
  attr_reader :source_block, :value

  def initialize(value, source_block)
    @value = value
    @source_block = source_block
  end

  def legible?
    true
  end

  def to_s
    value.to_s
  end
end
