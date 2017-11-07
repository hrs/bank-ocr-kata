class Digit
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def legible?
    true
  end

  def to_s
    value.to_s
  end
end
