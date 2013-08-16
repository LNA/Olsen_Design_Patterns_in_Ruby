# We have text that needs to be written.  We need:
# => the ability to write plain text,
# => number each line as it gets written out,
# => add a time stamp for each line,
# => and add a checksum from the text so that we can ensure that it was written and stored properly.

class SimpleWriter # dumb
  def initialize(path)
    @file = File.open(path, 'w')
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file.close
  end
end

# Our SimpleWriter class is a dumb class that knows how to perform a few file-related operations.
# We need to create a decorator that decorates the SimpleWriter.  

class WriterDecorator
  def initialize(real_writer)
    @real_writer = real_writer
  end

  def write_line(line)
    @real_writer.write_line(line)
  end

  def pos
    @real_writer.pos
  end

  def rewind
    @real_writer.rewind
  end

  def close
    @real_writer.close
  end
end

# A decorator that numbers our lines:

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

# To get our lines numbered:

writer = NumberingWriter.new(SimpleWriter.new('final.txt'))
writer.write_line('Hello out there')

# A decorator that computes checksums:

class CheckSummingWriter < WriterDecorator
  attr_reader :check_sum

  def initialize(real_writer)
    @real_writer = real_writer
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte {|byte| @check_sum = (@check_sum + byte) % 256}
    @check_sum += "\n"[0] % 256
    @real_writer.write_line(line)
  end
end

# A decorator to add a time stamp:

class TimeStampingWriter < WriterDecorator
  def write_line(line)
    @real_writer_write_line("#{Time.new}: #{line}")
  end
end

writer = CheckSummingWriter.new(TimeStampingWriter.new(
         NumberingWriter.new(SimpleWriter.new('final.txt'))))

writer.write_line('Hello out there')