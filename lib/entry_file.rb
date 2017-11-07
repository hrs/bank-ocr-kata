class EntryFile
  def initialize(file)
    @file = file
  end

  def entries
    entry_source_lines.map { |source_lines|
      EntryParser.new(source_lines).parse
    }
  end

  private

  attr_reader :file

  # "Entries" are three lines separated by a newline. So, for every four lines,
  # return an array of the first three.
  def entry_source_lines
    lines.each_slice(4).map { |slice| slice[0..2] }
  end

  def lines
    file.read.split("\n")
  end
end
