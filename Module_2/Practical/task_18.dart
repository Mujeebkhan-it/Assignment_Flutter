// Define a BankAccount class with properties like account number, account holder, and
// balance. Add methods to deposit, withdraw, and check the balance. Ensure the withdraw
// method doesn’t allow overdrafts.

class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print(
          'Deposited ${amount.toStringAsFixed(2)}. New balance: ${balance.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print(
          'Withdrew ${amount.toStringAsFixed(2)}. New balance: ${balance.toStringAsFixed(2)}');
    } else if (amount > balance) {
      print(
          'Insufficient funds Cannot withdraw ${amount.toStringAsFixed(2)}. Available balance: ${balance.toStringAsFixed(2)}');
    } else {
      print('enetr th valid withdrawal amount');
    }
  }

  void checkBalance() {
    print('Current balance: ${balance.toStringAsFixed(2)}');
  }
}

void main() {
  BankAccount account = BankAccount("71559989", "David Khan", 1000.00);

  account.checkBalance();
  account.deposit(800.00);
  account.withdraw(50.00);
  account.withdraw(50.00);
  account.checkBalance();
}
