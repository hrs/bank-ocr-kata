class IllegibleDigit
  attr_reader :source_block

  def initialize(source_block)
    @source_block = source_block
  end

  def legible?
    false
  end
end
