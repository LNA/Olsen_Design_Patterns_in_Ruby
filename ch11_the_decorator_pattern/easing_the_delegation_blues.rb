# The decorator uses a lot of delegation.  We can fix this by using the forwardable module.

require 'forwardable'

class WriterDecorator
  extend Forwardable

  def_delegators :@real_writer, :write_line, :rewind,
  :pos, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end