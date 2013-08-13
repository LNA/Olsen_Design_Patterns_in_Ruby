# Lets say we have to keep track of a bank account:

class BankAccount
  attr_reader :balance

  def initialize(starting_blance= 0)
    @balance = starting_blance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

# An instance of BankAccount is the subject.
# Let's create a proxy:

class BankAccountProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def balance
    @real_object.balance
  end

  def deposite(amount)
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    @real_object.withdraw(amount)
  end
end

account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)

proxy = BankAccountProxy.new(account)
account.deposit(50)
account.withdraw(10)
