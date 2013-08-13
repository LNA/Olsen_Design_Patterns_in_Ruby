# Command Pattern: 

# Use the command pattern when we have an object is used to represent and encapsulate all 
# the information needed to call a method at a later time.'

# Lets say that we have created an app and want
# to use it on a tablet.
# This app has buttons.  When a button is pushed,
# something happens.  What is the best way to execute the
# "something" ?

class Button
  def code_that_makes_button_look_great
    #some code
  end

  def action_that_happens_when_button_is_pushed
    # some code 
  end
end

# By "factoring out the action code into its own object".
# Put the action_that_happens_when_button_is_pushed
# into its own object that will perform an application
# specific task... but only after it is called. 
# These objects are the commands of the command pattern.


class Button
  attr_accessor :command
  def initialize(command)
    @command = command
  end

  def code_that_makes_button_look_great
    #some code
  end

  def action_that_happens_when_button_is_pushed
    @command.execute if @command 
  end
end

class OpenCommand
  def excute
    #code to open your email
  end
end

open_button = Button.new(OpenCommand.new)