# Ruby allows us to modify any class on the fly.

# Lets say that we don't want to build an adapter; we want to change the BritishTextObject class to look
# how we want to look.  To do so, we load the class that we'd like to modify and add new methods
# to the existing class.

require 'british_text_object' # See the_near_misses.rb

class BritishTestObject
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    size_mm / 24.5
  end