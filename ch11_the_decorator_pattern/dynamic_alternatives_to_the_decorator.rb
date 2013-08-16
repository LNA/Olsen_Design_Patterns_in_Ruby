# Wrapping methods:
# We can turn a writer into a time-stamping writer:

w = SimpleWriter.new('out')

class << w  
  alias old_write_line old_write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{:line}")
  end
end

# We can decorate the class with a module:

module TimeStampingWriter
  def write_line(line)
    super("#{Time.new}: #{:line}")
  end
end

module NumberWriter
  attr_reader :line_number

  def write_line(line)
    @line_number = 1 unless @line_number
    super("#{Time.new}: #{:line}")
    @line_number += 1
  end
end

w = SimpleWriter.new('out')
w.extend(NumberWriter)
w.extend(TimeStampingWriter)

w.write_line('hello')

