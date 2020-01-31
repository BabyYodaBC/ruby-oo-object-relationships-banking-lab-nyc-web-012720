require_relative "./bank_account.rb"

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount

    @@all << self
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && @status == "pending" && sender.balance >= @amount
    sender.balance -= @amount 
    receiver.balance += @amount
    @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @status == "complete"
      receiver.balance -= @amount 
      sender.balance += @amount
      @status = "reversed"
      end
    end

end
