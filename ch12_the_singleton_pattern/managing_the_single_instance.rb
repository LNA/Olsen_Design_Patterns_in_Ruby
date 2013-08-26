# We want the SimpleLogger class responsible for managing its single instance.
# We can turn SimpleLogger into a singleton:

class SimpleLogger
  #lots of code deleted.  See a_first_try_at_a_singleton.rb

  @@instance = SimpleLogger.new

  def self.instance
    return @@instance
  end
end

logger1 = SimpleLogger.instance #returns logger
logger2 = SimpleLogger.instance #returns exactly the same logger

#We can get the singleton logger from anywhere in our code and use it to write out messages:

SimpleLogger.instance.info('Computer wins chess game.')

SimpleLogger.instance.warning('AE35 hardware failure predicted.')

SimpleLogger.instance.error('HAL-9000 malfunction, take emergency action!')