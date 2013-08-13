# Commands can be useful in keeping track of what you have already done.
# In this section we use the command pattern to create, delete and copy files.

# Basic command class:

class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

# Command to create a file and write the contents of a string out to a new file:

class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
end

# Command to delete a file:

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    File.delete(@path)
  end
end

# Command to copy one file to another:
class CopyFile < Command
  def initialize(source, target)
    super("Copy file #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end
end