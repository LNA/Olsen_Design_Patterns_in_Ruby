# We can use a proxy to delay the creation of object until we need them.

# Called the biggest liar of the bunch, the virtual proxy pretends to be the real
# object.  However, it doesn't have a reference to the real object
# until the client code calls a method.

class VirtualAccountProxy
  def initialize(starting_balance= 0)
    @starting_balance = starting_balance
  end

  def deposit(amount)
    s = subject
    return s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    return s.withdraw(amount)
  end

  def balance
    s = subject
    return s.balance
  end

  def subject 
    @subject || (@subject = BankAccount.new(@starting_balance))
  end
end

# The problem with this code: the proxy is responsible for creating the bank account object.
# A better implementation would be:

class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  # the other methods are the same

  def subject
    @subject || (@subject = @creation_block.call)
  end
end

account = VirtualAccountProxy.new {BankAccount.new(10)}

# See proxies_to_the_rescue.rb for BankAccount class.