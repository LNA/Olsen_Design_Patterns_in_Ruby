# Allows us to tell the user exactly what we have been doing to his/her system.

class CompositeCommand < Command  
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each{|cmd| cmd.execute}
  end

  def description
    description = ""
    @commands.each {|cmd| description += cmd.description + "\n"}
    description
  end
end

cmds = CompositeCommand.new

cmds.add_command(CreateFile.new('file1.txt', "hello world\n"))
cmds.add_command(CopyFile.new('file1.txt, file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.execute # executes all three

# To explain to the user what is happening:

puts(cmds.description)

#=> Create file: file1.txt
#=> Cpy file: file1.txt to file2.txt
#=> Delete file: file1.txt