# What if we want to build our proxies without having to repeat all of the methods of the subject class?

class AccountProxy
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    puts("Delegating #{name} message to subject.")
    @subject.send(name, *args)
  end
end

ap = AccountProxy.new(BankAccount.new(100))
ap.deposit(25)
ap.withdraw(50)
puts("Account balance is now : #{ap.balance}")

# The method_missing method delegates each missing method to the subject.

# We can rewrite our original AccountProtectionProxy using the method_missing:

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name
  end

  def method_missing(name, *args)
    check_access
    @subject.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{Etc.getlogin} cannot access account."
    end
  end
end