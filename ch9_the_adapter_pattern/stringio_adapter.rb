# We want to encrypt a string.  We will do this with two classes; the adapter and
# a class created to encrypt files.

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    return ch
  end

  class Encrypter
    def initialize(key)
      @key = key
    end

    def encrypt(reader, writer)
      key_index = 0
      while not reader.eof?
        clear_char = reader.getc
        encrypted_char = clear_char^@key[key_index]
        writer.putc(encrypted_char)
        key_index = (key_index + 1) % @key.size
      end
    end
  end

  encrypter = Encrypter.new('XYZZY')
  reader= StringIOAdapter.new('We attack at dawn')
  writer= Fileopen('out.txt', 'w')
  encrypter.encrypt(reader, writer)