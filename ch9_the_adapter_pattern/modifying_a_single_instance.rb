# In addition to modifying an entire class on the fly we 
# can modify the behavior of a single instance of that class.

bto = BritishTextObject.new('hello', 50.8, :blue)

class << bto
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    size_mm / 25.4
  end
end

# Anther way to modify the behavior of a single instance is to modify the behavior of
# the bto object independently of its class.

def bto.color
  colour
end

def bto.text
  string
end