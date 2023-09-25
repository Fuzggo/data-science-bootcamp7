class ATM:
    def __init__ (self, name, bank ,balance,pin):
        self.name = name
        self.bank = bank
        self.balance = balance
        self.pin = pin

    def deposit(self, depo_amt):
        self.balance += depo_amt

    def withdraw(self, with_amt):
        if with_amt <= self.balance:
            self.balance -= with_amt
        else:
            print("Insufficient funds. Withdrawal not allowed.")

    def check_balance(self):
        return self.balance

    def transfer(self, recipient, transfer_amt):
        if transfer_amt <= self.balance:
            self.balance -= transfer_amt
            recipient.balance += transfer_amt
            print(f"Transfer of {transfer_amt} to {recipient.name}'s account successful.")
        else:
            print("Insufficient funds for the transfer.")

    def change_pin(self, new_pin):
        if len(new_pin) == 4 and new_pin.isdigit():
            self.pin = new_pin
            print("Your PIN has been successfully changed.")
        else:
            print("Invalid PIN format. Please enter a 4-digit numeric PIN.")

# Example usage
customer1 = ATM("Focus", "SCB", 5000, 7531)
customer2 = ATM("Kaitoon", "Kbank", 8000, 8952)

#Deposit method
customer1.deposit(2000)
print(customer1.name, customer1.bank, customer1.balance)

#Withdraw method
customer1.withdraw(3000)
print(customer1.name, customer1.bank, customer1.balance)

#Check balance method
customer1.check_balance()

#Transfer method
customer1.transfer(customer2, 2000)
print(customer1.name, customer1.bank, customer1.balance)
print(customer2.name, customer2.bank, customer2.balance)

#Change pin method
customer1.change_pin("1234")
print(customer1.name, customer1.bank, customer1.balance, customer1.pin)
