# We can use the class itself as the container for the singleton functionality:

class ClassBasedLogger
  
  ERROR = 1
  WARNING = 2
  INFO = 3
  @@log = File.open('log.txt', 'w')
  @@level = WARNING

  def self.error(msg)
    @@log.puts(msg)
    @@log.flush
  end

  def self.warning(msg)
    @@log.puts(msg) if @@level >= WARNING
    @@log.flush
  end

  def self.info(msg)
    @@log.puts(msg) if @@level >= INFO
    @@log.flush
  end

  def self.level=(new_level)
    @@level = new_level
  end

  def self.level
    @@level
  end
end

  ClassBasedLogger.level = ClassBasedLogger::INFO

  ClassBasedLogger.info('Computer wins chess game.')

  ClassBasedLogger.warning('AE35 hardware failure predicted.')

  ClassBasedLogger.error('HAL-9000 malfunction, take emergency action!')