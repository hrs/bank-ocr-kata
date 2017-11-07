class Entry
  def initialize(digits)
    @digits = digits
  end

  def valid?
    legible_digits? &&
      checksum % 11 == 0
  end

  def to_s
    digits.map(&:to_s).join
  end

  private

  attr_reader :digits

  def legible_digits?
    digits.all?(&:legible?)
  end

  def checksum
    dot_product(values, checksum_multiplers.reverse)
  end

  def values
    digits.map(&:value)
  end

  def checksum_multiplers
    (1..9).to_a
  end

  def dot_product(xs, ys)
    xs.
      zip(ys).
      map { |x, y| x * y }.
      inject(&:+)
  end
end
