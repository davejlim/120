=begin
Ben asked Alyssa to code review the following code:

Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the 
@ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?
=end

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
Ben is right here because he is invoking the getter method defined and created by the
attr_reader method. So it is not an instance variable but rather we are invoking
the getter method to get the return value of @balance.
=end

new_bank = BankAccount.new(5)
p new_bank.positive_balance?

new_bank = BankAccount.new(-5)
p new_bank.positive_balance?
