class Button
  attr_accessor :command
  def initialize(&block)
    @command = block
  end

  def code_that_makes_button_look_great
    #some code
  end

  def action_that_happens_when_button_is_pushed
    @command.call if @command 
  end
end

open_button = Button.new do 
  #pass in code block to open email
end