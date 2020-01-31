class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            return true
        else 
            false
        end
    end

    def close_account
        @status = "closed"
    end




end
