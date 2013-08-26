# One requirement of a singleton is to make sure that there is only one 
# instance of the singleton class.  We can ensure that this will be the case 
# by making the new method on SimpleLogger private:

class SimpleLogger
  # deleted code.  See a_first_try_at_a_singleton.rb

  @@instance = SimpleLogger.new

  def self.instance
    return @@instance
  end

  private_class_method :new # prevents any other class from creating new instance of SimpleLogger
end