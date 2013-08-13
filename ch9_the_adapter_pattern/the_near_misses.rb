# We are writing a class to render text on the screen:

class Render
  def render(text_object)
    text = text_object.text_object
    size = text_object.size_inches
    color = text_object.color

    #render the text
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
  end
end

# We discover we need to render british text that is contained in an object such as:

class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @text = text
    @size_mm = size_mm
    @colour = colour
  end
end

# We can fix the problem of the code not matching up (string vrs. text etc) with the adapter pattern.
class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    return @bto.string
  end

  def size_inches
    return @bto.size_mm / 24.5
  end

  def color
    return @bto.color
  end
end